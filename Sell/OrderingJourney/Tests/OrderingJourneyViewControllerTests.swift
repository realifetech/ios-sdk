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
        let sut = OrderingJourneyViewController(urlString: urlString,
                                                colorStore: EmptyColorStore(),
                                                javascriptRunDetails: nil,
                                                applicationURLOpener: MockApplicationURLOpener())
        XCTAssertNotNil(sut.rootView.dismiss)
    }

    func test_initWithCoder_returnsNil() {
        XCTAssertNil(OrderingJourneyViewController(coder: NSCoder()))
    }

    func test_dismiss_viewControllerIsDismissed() {
        let sut = MockViewController(urlString: urlString,
                                     colorStore: EmptyColorStore(),
                                     javascriptRunDetails: nil,
                                     applicationURLOpener: MockApplicationURLOpener())
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

private final class MockApplicationURLOpener: ApplicationURLOpening {
    func canOpenURL(_ url: URL) -> Bool { return false }
    func open(_ url: URL,
              options: [UIApplication.OpenExternalURLOptionsKey: Any],
              completionHandler completion: ((Bool) -> Void)?) { }
}
