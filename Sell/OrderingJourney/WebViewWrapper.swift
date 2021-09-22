//
//  WebViewWrapper.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI
import Combine
import WebKit

final class WebViewWrapper: UIViewRepresentable {

    typealias UIViewType = WKWebView

    private let webView: WKWebView
    private let urlRequest: URLRequest
    private let scheduler: DispatchQueueAnyScheduler
    private var javascriptToEvaluate: String?
    private var completionToFireAfterEvaluation: ((Any?, Error?) -> Void)?

    @ObservedObject private var store: WebViewStore

    init(
        webView: WKWebView,
        urlRequest: URLRequest,
        store: WebViewStore,
        scheduler: DispatchQueueAnyScheduler = .main
    ) {
        self.webView = webView
        self.urlRequest = urlRequest
        self.store = store
        self.scheduler = scheduler
    }

    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        webView.load(urlRequest)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { }

    func evaluate(javascript: String, completion: ((Any?, Error?) -> Void)?) {
        guard !webView.isLoading else {
            javascriptToEvaluate = javascript
            completionToFireAfterEvaluation = completion
            return
        }
        webView.evaluateJavaScript(javascript, completionHandler: completion)
    }

    func reload() {
        store.webViewNavigationPublisher.send(.reload)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, scheduler: scheduler)
    }
}

extension WebViewWrapper {

    final class Coordinator: NSObject {

        private let parent: WebViewWrapper
        private var webViewNavigationSubscriber: AnyCancellable?
        private let scheduler: DispatchQueueAnyScheduler

        init(_ wrapper: WebViewWrapper, scheduler: DispatchQueueAnyScheduler) {
            self.parent = wrapper
            self.scheduler = scheduler
            self.webViewNavigationSubscriber = nil
        }

        deinit {
            webViewNavigationSubscriber?.cancel()
        }
    }
}

extension WebViewWrapper.Coordinator: WKNavigationDelegate {

    func webView(
        _ webView: WKWebView,
        createWebViewWith configuration: WKWebViewConfiguration,
        for navigationAction: WKNavigationAction,
        windowFeatures: WKWindowFeatures
    ) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }

    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        webViewNavigationSubscriber =
            parent.store.webViewNavigationPublisher
            .receive(on: scheduler)
            .sink(receiveValue: { navigation in
                switch navigation {
                case .backward:
                    if webView.canGoBack {
                        webView.goBack()
                    }
                case .forward:
                    if webView.canGoForward {
                        webView.goForward()
                    }
                case .reload:
                    webView.reload()
                }
            })
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        parent.store.canGoBack.send(webView.canGoBack)
        parent.store.canGoForward.send(webView.canGoForward)
        if let javascript = parent.javascriptToEvaluate {
            parent.evaluate(javascript: javascript, completion: parent.completionToFireAfterEvaluation)
        }
    }
}
