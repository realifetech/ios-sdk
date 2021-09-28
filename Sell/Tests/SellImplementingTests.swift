//
//  SellImplementingTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 19/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class SellImplementingTests: XCTestCase {

    private var sut: SellImplementing!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let graphQLManager = MockGraphQLManager<ApolloType.GetProductsQuery.Data>()
        let sell = SellFactory.makeSellModule(
            graphQLManager: graphQLManager,
            orderingJourneyUrl: "",
            colorStore: EmptyColorStore(),
            applicationURLOpener: MockApplicationURLOpener())
        sut = try XCTUnwrap(sell as? SellImplementing)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_createOrderingJourneyViewController() {
        XCTAssertNil(sut.orderingJourneyViewUpdater.orderingJourneyView)
        XCTAssertTrue(sut.createOrderingJourneyViewController() is OrderingJourneyViewController)
        XCTAssertNotNil(sut.orderingJourneyViewUpdater.orderingJourneyView)
    }

    func test_createOrderingJourneyView() {
        XCTAssertNil(sut.orderingJourneyViewUpdater.orderingJourneyView)
        let view = sut.createOrderingJourneyView()
        XCTAssertNotNil(view.urlRequest.url)
        XCTAssertNotNil(sut.orderingJourneyViewUpdater.orderingJourneyView)
    }
}

private final class MockApplicationURLOpener: ApplicationURLOpening {
    func canOpenURL(_ url: URL) -> Bool { return false }
    func open(_ url: URL,
              options: [UIApplication.OpenExternalURLOptionsKey: Any],
              completionHandler completion: ((Bool) -> Void)?) { }
}
