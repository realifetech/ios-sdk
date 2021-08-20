//
//  OrderingJourneyViewControllerTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 18/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class OrderingJourneyViewControllerTests: XCTestCase {

    private let urlString = "https://www.google.com"

    func test_initWithUrlString_rootViewDismissFunctionIsSet() {
        let sut = OrderingJourneyViewController(urlString: urlString, colorStore: PreviewColorStore())
        XCTAssertNotNil(sut.rootView.dismiss)
    }

    func test_initWithCoder_returnsNil() {
        XCTAssertNil(OrderingJourneyViewController(coder: NSCoder()))
    }

    func test_dismiss_viewControllerIsDismissed() {
        let sut = MockViewController(urlString: urlString, colorStore: PreviewColorStore())
        sut.dismiss()
        XCTAssertTrue(sut.dismissGetsCalled)
    }
}

private final class MockViewController: OrderingJourneyViewController {

    var dismissGetsCalled = false

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismissGetsCalled = true
    }
}
