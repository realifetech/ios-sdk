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

    private let webPage = WebPage(url: URL(string: "https://www.google.com")!)

    func test_initialise_resultAndDelegateDidSet() {
        let delegate = MockWebPageViewControllerDelegate()
        let sut = makeSUT(delegate: delegate)
        guard case let .success(returnedWebPage) = sut.result else {
            return XCTFail("Fail to get the success result")
        }
        XCTAssertEqual(returnedWebPage.url, webPage.url)
        XCTAssertTrue(sut.delegate is MockWebPageViewControllerDelegate)
    }

    func test_viewDidLoad_resultIsSuccess_webViewIsSetupAndObserversAreSet() {
        let sut = makeSUT()
        XCTAssertNotNil(sut.webView.uiDelegate)
        XCTAssertNotNil(sut.webView.navigationDelegate)
        XCTAssertNotNil(sut.canGoBackObserver)
        XCTAssertNotNil(sut.canGoForwardObserver)
        XCTAssertNotNil(sut.estimatedProgressObserver)
    }

    func test_viewDidLoad_resultIsFailure_webViewIsSetupButNotSetupObservers() {
        let sut = makeSUT(with: false)
        XCTAssertNotNil(sut.webView.uiDelegate)
        XCTAssertNotNil(sut.webView.navigationDelegate)
        XCTAssertNil(sut.canGoBackObserver)
        XCTAssertNil(sut.canGoForwardObserver)
        XCTAssertNil(sut.estimatedProgressObserver)
    }

    func test_viewDidDisappear_webViewIsLoading_shouldStopLoadingAndInvalidateObservers() {
        let sut = makeSUT()
        XCTAssertTrue(sut.webView.isLoading)
        sut.viewDidDisappear(false)
        XCTAssertNil(sut.canGoBackObserver)
        XCTAssertNil(sut.canGoForwardObserver)
        XCTAssertNil(sut.estimatedProgressObserver)
    }

    func test_webViewDecidePolicyForNavigationAction_withUrl_policyDidReceivedAndDelegateMethodGetsCalled() {
        let delegate = MockWebPageViewControllerDelegate()
        let sut = makeSUT(delegate: delegate)
        var receivedPolicy: WKNavigationActionPolicy?
        let navigation = createFakeNavigationAction(url: webPage.url)
        sut.webView(sut.webView, decidePolicyFor: navigation) { receivedPolicy = $0 }
        XCTAssertEqual(receivedPolicy, .allow)
        XCTAssertEqual(delegate.urlReceived, webPage.url)
    }

    func test_webViewDidStartProvisionalNavigation_delegateMethodGetsCalled() {
        let delegate = MockWebPageViewControllerDelegate()
        let sut = makeSUT(delegate: delegate)
        let navigation = createNavigation(url: webPage.url, webView: sut.webView)
        sut.webView(sut.webView, didStartProvisionalNavigation: navigation)
        XCTAssertTrue(delegate.startedProvisionalNavigation)
    }

    func test_webViewDidFinish_delegateMethodGetsCalled() {
        let delegate = MockWebPageViewControllerDelegate()
        let sut = makeSUT(delegate: delegate)
        let navigation = createNavigation(url: webPage.url, webView: sut.webView)
        sut.webView(sut.webView, didFinish: navigation)
        XCTAssertTrue(delegate.finishedNavigation)
    }

    private func makeSUT(
        with successResult: Bool = true,
        delegate: WebPageViewControllerDelegate? = nil
    ) -> WebPageViewController {
        let sut = WebPageViewController(
            result: successResult ? .success(webPage) : .failure(DummyError.failure),
            delegate: delegate)
        _ = sut.view
        return sut
    }
}

// MARK: - Mocks

private final class MockWebPageViewControllerDelegate: WebPageViewControllerDelegate {

    var urlReceived: URL?
    var startedProvisionalNavigation = false
    var finishedNavigation = false

    func webViewCanGoBack() { }

    func webViewCanGoForward() { }

    func webViewEstimatedProgressChanged(_ progress: Double) { }

    func urlForNavigationAction(_ url: URL?) {
        urlReceived = url
    }

    func webViewDidStartProvisionalNavigation() {
        startedProvisionalNavigation = true
    }

    func webViewDidFinishNavigation() {
        finishedNavigation = true
    }
}

private final class FakeNavigationAction: WKNavigationAction {

    let testRequest: URLRequest

    override var request: URLRequest {
        return testRequest
    }

    init(testRequest: URLRequest) {
        self.testRequest = testRequest
        super.init()
    }
}

// MARK: - Helper

private func createFakeNavigationAction(url: URL) -> FakeNavigationAction {
    return FakeNavigationAction(testRequest: URLRequest(url: url))
}

private func createNavigation(url: URL, webView: WKWebView) -> WKNavigation? {
    let urlRequest = URLRequest(url: url)
    return webView.load(urlRequest)
}
