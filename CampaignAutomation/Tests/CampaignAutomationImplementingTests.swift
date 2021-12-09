//
//  CampaignAutomationImplementingTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 08/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class CampaignAutomationImplementingTests: XCTestCase {

    private var mockAnalytics: MockAnalytics!
    private var sut: CampaignAutomationImplementing!

    override func setUpWithError() throws {
        mockAnalytics = MockAnalytics()
        sut = CampaignAutomationImplementing(defaultFetcher: RLTViewFetcher(),
                                             analyticsLogger: mockAnalytics)
    }

    override func tearDownWithError() throws {
        mockAnalytics = nil
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
        let dictionary = sut.createAnalyticEventDictionary(campaignId: 1,
                                                           externalId: "2",
                                                           contentId: 3,
                                                           contentType: "4",
                                                           languageCode: "5")
        XCTAssertEqual(dictionary["campaignId"] as? Int, 1)
        XCTAssertEqual(dictionary["externalId"] as? String, "2")
        XCTAssertEqual(dictionary["contentId"] as? Int, 3)
        XCTAssertEqual(dictionary["contentType"] as? String, "4")
        XCTAssertEqual(dictionary["languageCode"] as? String, "5")
    }

    private let responseItems = [
        CAGetContentResponseItem(campaignId: 1, contentType: "banner", data: ["title": "Banner title",
                                                                     "subtitle": "Banner subtitle",
                                                                     "url": "https://google.com"]),
        CAGetContentResponseItem(campaignId: 1, contentType: "ticket", data: ["eventName": "Event 1"]),
        CAGetContentResponseItem(campaignId: 1, contentType: "ticket", data: ["eventName": "Event 2"]),
        CAGetContentResponseItem(campaignId: 1, contentType: "product", data: ["price": 2.0]),
        CAGetContentResponseItem(campaignId: 1, contentType: "banner", data: ["title": "Banner title 2",
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
