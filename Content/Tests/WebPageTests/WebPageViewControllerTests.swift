//
//  WebPageViewControllerTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 03/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import WebKit
@testable import RealifeTech

final class WebPageViewControllerTests: XCTestCase {

    private var webPageCreator: MockWebPageCreator!
    // swiftlint:disable:next weak_delegate
    private var delegate: MockWebPageViewControllerDelegate!
    private var sut: WebPageViewController!

    override func setUp() {
        super.setUp()
        webPageCreator = MockWebPageCreator()
        delegate = MockWebPageViewControllerDelegate()
        sut = WebPageViewController(
            webPageCreator: webPageCreator,
            type: .about,
            delegate: delegate)
    }

    override func tearDown() {
        delegate = nil
        webPageCreator = nil
        sut = nil
        super.tearDown()
    }

    func test_initialise_delegateDidSet() {
        XCTAssertTrue(sut.delegate is MockWebPageViewControllerDelegate)
    }

    func test_viewDidLoad_fetchSucceed_webViewIsLoading() {
        _ = sut.view
        XCTAssertTrue(sut.webView.isLoading)
    }

    func test_viewDidLoad_fetchFailure_delegateGetsError() {
        webPageCreator.shouldReturnError = true
        _ = sut.view
        XCTAssertFalse(sut.webView.isLoading)
        XCTAssertTrue(delegate.errorReceived is DummyError)
    }
}

// MARK: - Mocks

private let webPage = WebPage(url: URL(string: "https://www.google.com")!)

private final class MockWebPageCreator: WebPageCreatable {

    var shouldReturnError = false

    func getWebPage(forType type: WebPage.`Type`, completion: @escaping (Result<WebPage, Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(DummyError.failure))
        } else {
            completion(.success(webPage))
        }
    }

    func createWebPageView(
        forType type: WebPage.`Type`,
        webPgaeViewControllerDelegate: WebPageViewControllerDelegate?
    ) -> WebPageViewController {
        return WebPageViewController(
            webPageCreator: MockWebPageCreator(),
            type: .about,
            delegate: nil)
    }
}

private final class MockWebPageViewControllerDelegate: WebPageViewControllerDelegate {

    var errorReceived: Error?

    func getError(_ error: Error) {
        errorReceived = error
    }
}
