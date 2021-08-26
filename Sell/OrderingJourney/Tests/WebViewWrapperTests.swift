//
//  WebViewWrapperTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 18/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import SwiftUI
import WebKit
import Combine
@testable import RealifeTech

final class WebViewWrapperTests: XCTestCase {

    private var webView: MockWebView!
    private var url: URL!
    private var urlRequest: URLRequest!
    private var store: WebViewStore!
    private var scheduler: DispatchQueueTestScheduler!
    private var sut: WebViewWrapper!
    private var bag = Set<AnyCancellable>()

    override func setUpWithError() throws {
        try super.setUpWithError()
        webView = MockWebView()
        url = try XCTUnwrap(URL(string: "https://www.google.com"))
        urlRequest = URLRequest(url: url)
        store = WebViewStore()
        scheduler = DispatchQueueTestScheduler()
        sut = WebViewWrapper(
            webView: webView,
            urlRequest: urlRequest,
            store: store,
            scheduler: scheduler.eraseToAnyScheduler())
    }

    override func tearDown() {
        sut = nil
        scheduler = nil
        store = nil
        urlRequest = nil
        url = nil
        webView = nil
        super.tearDown()
    }

    func test_coordinatorCreateWebViewWithConfiguration_navigationActionTargetFrameIsNil_webViewCallsLoadRequest() {
        let navigationAction = createFakeNavigationAction(url: url)
        let returnedWebView = sut.makeCoordinator().webView(
            webView,
            createWebViewWith: WKWebViewConfiguration(),
            for: navigationAction,
            windowFeatures: WKWindowFeatures())
        XCTAssertEqual(webView.receivedUrl, url)
        XCTAssertNil(returnedWebView)
    }

    func test_coordinatorDecidePolicyForNavigationAction_receivedPolicyIsAllowType() {
        var receivedPolicy: WKNavigationActionPolicy?
        let navigationAction = createFakeNavigationAction(url: url)
        sut.makeCoordinator().webView(
            webView,
            decidePolicyFor: navigationAction
        ) { receivedPolicy = $0 }
        XCTAssertEqual(receivedPolicy, .allow)
    }

    func test_coordinatorDidStartProvisionalNavigation_reloadNavigation_webViewDidReload() {
        let wkNavigation = createNavigation(url: url, webView: webView)
        let coordinator = sut.makeCoordinator()
        coordinator.webView(
            webView,
            didStartProvisionalNavigation: wkNavigation)
        store.webViewNavigationPublisher.send(.reload)
        XCTAssertTrue(webView.didReload)
    }

    func test_coordinatorDidStartProvisionalNavigation_backwardNavigation_webViewGoesBack() {
        let wkNavigation = createNavigation(url: url, webView: webView)
        let coordinator = sut.makeCoordinator()
        coordinator.webView(
            webView,
            didStartProvisionalNavigation: wkNavigation)
        store.webViewNavigationPublisher.send(.backward)
        XCTAssertTrue(webView.didGoBack)
    }

    func test_coordinatorDidStartProvisionalNavigation_forwardNavigation_webViewGoesForward() {
        let wkNavigation = createNavigation(url: url, webView: webView)
        let coordinator = sut.makeCoordinator()
        coordinator.webView(
            webView,
            didStartProvisionalNavigation: wkNavigation)
        store.webViewNavigationPublisher.send(.forward)
        XCTAssertTrue(webView.didGoForward)
    }

    func test_coodinatorWebViewDidFinishNavigation() {
        let wkNavigation = createNavigation(url: url, webView: webView)
        let coordinator = sut.makeCoordinator()
        coordinator.webView(webView, didFinish: wkNavigation)
        let canGoBackExpectation = XCTestExpectation(description: "canGoBack receives value")
        store.canGoBack
            .sink { _ in
                canGoBackExpectation.fulfill()
            }
            .store(in: &bag)
        let canGoForwardExpectation = XCTestExpectation(description: "canGoForward receives value")
        store.canGoForward
            .sink { _ in
                canGoForwardExpectation.fulfill()
            }
            .store(in: &bag)
        wait(for: [canGoBackExpectation, canGoForwardExpectation], timeout: 0.01)
    }
}

// MARK: - Mocks
private final class MockWebView: WKWebView {

    var shouldGoBack = true
    var shouldGoForward = true

    var receivedUrl: URL?
    var didReload = false
    var didGoBack = false
    var didGoForward = false

    override var canGoBack: Bool {
        shouldGoBack
    }

    override var canGoForward: Bool {
        shouldGoForward
    }

    override func load(_ request: URLRequest) -> WKNavigation? {
        receivedUrl = request.url
        return nil
    }

    override func reload() -> WKNavigation? {
        didReload = true
        return nil
    }

    override func goBack() -> WKNavigation? {
        didGoBack = true
        return nil
    }

    override func goForward() -> WKNavigation? {
        didGoForward = true
        return nil
    }
}

private final class FakeNavigationAction: WKNavigationAction {

    let testRequest: URLRequest
    var targetFrameReturns: WKFrameInfo?

    override var targetFrame: WKFrameInfo? { targetFrameReturns }

    override var request: URLRequest {
        return testRequest
    }

    init(testRequest: URLRequest) {
        self.testRequest = testRequest
        super.init()
    }
}

// MARK: - Helpers
private func createFakeNavigationAction(url: URL) -> FakeNavigationAction {
    return FakeNavigationAction(testRequest: URLRequest(url: url))
}

private func createNavigation(url: URL, webView: WKWebView) -> WKNavigation? {
    let urlRequest = URLRequest(url: url)
    return webView.load(urlRequest)
}
