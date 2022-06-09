//
//  CampaignAutomationImplementingTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 08/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech
@testable import GraphQL
import Apollo

private typealias QueryDataType = ApolloTypeCA.GetContentByExternalIdQuery.Data

class CampaignAutomationImplementingTests: XCTestCase {

    private var mockAnalytics: MockAnalyticsLogger!
    private var sut: CampaignAutomationImplementing!
    private var graphQLManager: MockGraphQLManager<QueryDataType>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockAnalytics = MockAnalyticsLogger()
        graphQLManager = MockGraphQLManager<QueryDataType>()
        sut = CampaignAutomationImplementing(graphQLManager: graphQLManager,
                                             defaultFetcher: RLTViewFetcher(),
                                             analyticsLogger: mockAnalytics)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        mockAnalytics = nil
        graphQLManager = nil
        sut = nil
    }

    func test_generateCreatables_noMatchingFactories() {
        let creatables = sut.buildCreatables(for: "", from: responseItems, using: [:])
        XCTAssertEqual(creatables.count, 0)
    }

    func test_generateCreatables() {
        let creatables = sut.buildCreatables(for: "",
                                             from: responseItems,
                                             using: [.banner: MockBannerFactory()])
        XCTAssertEqual(creatables.count, 2)
        XCTAssertEqual((creatables.first as? MockBannerCreatable)?.title, "Banner title")
        XCTAssertEqual((creatables.last as? MockBannerCreatable)?.title, "Banner title 2")
        XCTAssertEqual(mockAnalytics.eventsLogged.count, 2)
        XCTAssertEqual(mockAnalytics.eventsLogged.first?.action, "loadContent")
        XCTAssertEqual(mockAnalytics.eventsLogged.last?.type, "user")
        XCTAssertNotNil(mockAnalytics.eventsLogged.last?.new)
        (creatables.first as? MockBannerCreatable)?.linkEvent?()
        XCTAssertEqual(mockAnalytics.eventsLogged.count, 3)
        XCTAssertEqual(mockAnalytics.eventsLogged.last?.action, "interactWithContent")
        XCTAssertNotNil(mockAnalytics.eventsLogged.last?.new)
    }

    func test_generateAnalyticEventDictionary() {
        let dictionary = sut.createAnalyticEventDictionary(campaignId: "1",
                                                           externalId: "2",
                                                           contentId: 3,
                                                           contentType: "4",
                                                           languageCode: "5")
        XCTAssertEqual(dictionary["campaignId"] as? String, "1")
        XCTAssertEqual(dictionary["externalId"] as? String, "2")
        XCTAssertEqual(dictionary["contentId"] as? Int, 3)
        XCTAssertEqual(dictionary["contentType"] as? String, "4")
        XCTAssertEqual(dictionary["languageCode"] as? String, "5")
    }

    func test_generateCreatables_success() {
        let item = QueryDataType.GetContentByExternalId.Item(contentType: .banner, data: responseItems[0].data)
        let getContentByExternalId = QueryDataType.GetContentByExternalId(campaignId: "1",
                                                                          items: [item])
        let data = QueryDataType(getContentByExternalId: getContentByExternalId)
        let result = GraphQLResult<QueryDataType>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .server,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(result)
        sut.generateCreatables(for: "", factories: [.banner: MockBannerFactory()]) { result in
            guard case let .success(creatables) = result, let banner = creatables.first as? MockBannerCreatable else {
                return XCTFail("Test failed")
            }
            XCTAssertEqual(creatables.count, 1)
            XCTAssertEqual(banner.title, "Banner title")
        }
    }

    func test_generateCreatables_failure() {
        graphQLManager.resultReturns = .failure(DummyError.failure)
        sut.generateCreatables(for: "", factories: [.banner: MockBannerFactory()]) { result in
            guard case let .failure(error) = result else {
                return XCTFail("Test failed")
            }
            XCTAssertEqual((error as? DummyError), DummyError.failure)
            // ensure that cache was accessed after server query failure
            XCTAssertEqual(self.graphQLManager.numberOfQueriesCalled, 2)
        }
    }

    func test_fechData_success() {
        let items = responseItems.map {
            QueryDataType.GetContentByExternalId.Item(
                contentType: ApolloTypeCA.ContentType(rawValue: $0.contentType ?? ""),
                data: $0.data)
        }
        let getContentByExternalId = QueryDataType.GetContentByExternalId(campaignId: "1",
                                                                          items: items)
        let data = QueryDataType(getContentByExternalId: getContentByExternalId)
        let result = GraphQLResult<QueryDataType>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .server,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(result)
        sut.fetchData(for: "") { result in
            guard case let .success(rltItems) = result else {
                return XCTFail("Test failed")
            }
            let responseBannerItems: [RLTBanner] = self.responseItems.compactMap { $0.unwrappedDataModel as? RLTBanner }
            let bannerItemsResult: [RLTBanner] = rltItems.compactMap { $0.data as? RLTBanner }
            XCTAssertEqual(bannerItemsResult.count, responseBannerItems.count)
            for (index, bannerItem) in bannerItemsResult.enumerated() {
                XCTAssertEqual(responseBannerItems[index].title, bannerItem.title)
                XCTAssertEqual(responseBannerItems[index].subtitle, bannerItem.subtitle)
                XCTAssertEqual(responseBannerItems[index].url, bannerItem.url)
            }
        }
    }

    func test_fetchData_failure() {
        graphQLManager.resultReturns = .failure(DummyError.failure)
        sut.fetchData(for: "") { result in
            guard case let .failure(error) = result else {
                return XCTFail("Test failed")
            }
            XCTAssertEqual((error as? DummyError), DummyError.failure)
        }
    }

    private let responseItems = [
        CAGetContentResponseItem(campaignId: "1", contentType: "banner", data: ["title": "Banner title",
                                                                     "subtitle": "Banner subtitle",
                                                                     "url": "https://google.com"]),
        CAGetContentResponseItem(campaignId: "1", contentType: "ticket", data: ["eventName": "Event 1"]),
        CAGetContentResponseItem(campaignId: "1", contentType: "ticket", data: ["eventName": "Event 2"]),
        CAGetContentResponseItem(campaignId: "1", contentType: "product", data: ["price": 2.0]),
        CAGetContentResponseItem(campaignId: "1", contentType: "banner", data: ["title": "Banner title 2",
                                                                     "subtitle": "Banner subtitle 2",
                                                                     "url": "https://google.com/2"])
    ]
}

private struct MockBannerCreatable: RLTCreatable {
    let title: String
    let linkEvent: (() -> Void)?
}

private class MockBannerFactory: RLTBannerFactory {
    var urlOpened: URL?
    func create(from dataModel: RLTBanner) -> RLTCreatable? {
        let openHandler: (URL) -> Void = { url in
            self.urlOpened = url
        }
        return MockBannerCreatable(title: dataModel.title ?? "",
                                   linkEvent: dataModel.generateLinkHandler(openHandler: openHandler))
    }
}
