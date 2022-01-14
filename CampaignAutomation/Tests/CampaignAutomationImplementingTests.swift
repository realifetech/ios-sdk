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

    private var mockAnalytics: MockAnalytics!
    private var sut: CampaignAutomationImplementing!
    private var graphQLManager: MockGraphQLManager<QueryDataType>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockAnalytics = MockAnalytics()
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
        XCTAssertEqual(mockAnalytics.loggedEvents.count, 2)
        XCTAssertEqual(mockAnalytics.loggedEvents.first?.action, "loadContent")
        XCTAssertEqual(mockAnalytics.loggedEvents.last?.type, "user")
        XCTAssertNotNil(mockAnalytics.loggedEvents.last?.new)
        (creatables.first as? MockBannerCreatable)?.linkEvent?()
        XCTAssertEqual(mockAnalytics.loggedEvents.count, 3)
        XCTAssertEqual(mockAnalytics.loggedEvents.last?.action, "interactWithContent")
        XCTAssertNotNil(mockAnalytics.loggedEvents.last?.new)
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

        let expectation = XCTestExpectation(description: "Completion fulfilled")
        sut.generateCreatables(for: "", factories: [.banner: MockBannerFactory()]) { result in
            guard case let .success(creatables) = result, let banner = creatables.first as? MockBannerCreatable else {
                return XCTFail("Test failed")
            }
            XCTAssertEqual(creatables.count, 1)
            XCTAssertEqual(banner.title, "Banner title")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_generateCreatables_failure() {
        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "Completion fulfilled")
        sut.generateCreatables(for: "", factories: [.banner: MockBannerFactory()]) { result in
            guard case let .failure(error) = result else {
                return XCTFail("Test failed")
            }
            XCTAssertEqual((error as? DummyError), DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
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

private class MockAnalytics: Analytics {
    var loggedEvents = [AnalyticEvent]()
    func logEvent(_ event: AnalyticEvent, completion: @escaping (Result<Bool, Error>) -> Void) {
        loggedEvents.append(event)
    }
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
