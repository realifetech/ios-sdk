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

extension UIApplication: ApplicationURLOpening { }

final class WebViewWrapper: UIViewRepresentable {

    typealias UIViewType = WKWebView

    private let webView: WKWebView
    private let urlRequest: URLRequest
    private let scheduler: DispatchQueueAnyScheduler
    public var javascriptRunDetails: JavascriptRunDetails?
    private let applicationURLOpener: ApplicationURLOpening

    @ObservedObject private var store: WebViewStore

    init(
        webView: WKWebView,
        urlRequest: URLRequest,
        store: WebViewStore,
        scheduler: DispatchQueueAnyScheduler = .main,
        javascriptRunDetails: JavascriptRunDetails?,
        applicationURLOpener: ApplicationURLOpening
    ) {
        self.webView = webView
        self.urlRequest = urlRequest
        self.store = store
        self.scheduler = scheduler
        self.javascriptRunDetails = javascriptRunDetails
        self.applicationURLOpener = applicationURLOpener
    }

    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        webView.load(urlRequest)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { }

    func evaluate(javascriptRunDetails: JavascriptRunDetails) {
        guard !webView.isLoading else {
            self.javascriptRunDetails = javascriptRunDetails
            return
        }
        webView.evaluateJavaScript(javascriptRunDetails.javascript) { [weak self] result, error in
            if error == nil && javascriptRunDetails.reloadOnSuccess {
                self?.webView.reload()
            }
            javascriptRunDetails.completion?(result, error)
            self?.javascriptRunDetails = nil
        }
    }

    func reload() {
        webView.reload()
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, scheduler: scheduler, applicationURLOpener: applicationURLOpener)
    }
}

extension WebViewWrapper {

    final class Coordinator: NSObject {

        private let parent: WebViewWrapper
        private var webViewNavigationSubscriber: AnyCancellable?
        private let scheduler: DispatchQueueAnyScheduler
        private let applicationURLOpener: ApplicationURLOpening

        init(_ wrapper: WebViewWrapper,
             scheduler: DispatchQueueAnyScheduler,
             applicationURLOpener: ApplicationURLOpening) {
            self.parent = wrapper
            self.scheduler = scheduler
            self.webViewNavigationSubscriber = nil
            self.applicationURLOpener = applicationURLOpener
        }

        func evaluateOutstandingJavascript() {
            guard let runDetails = parent.javascriptRunDetails else { return }
            self.parent.evaluate(javascriptRunDetails: runDetails)
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
        if let url = deepLinkURL(urlToEvaluate: navigationAction.request.url) {
            applicationURLOpener.open(url, options: [:], completionHandler: nil)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }

    func deepLinkURL(urlToEvaluate: URL?) -> URL? {
        guard let url = urlToEvaluate,
              !url.absoluteString.hasPrefix("http://"),
              !url.absoluteString.hasPrefix("https://"),
              applicationURLOpener.canOpenURL(url) else {
            return nil
        }
        return url
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
                case .evaluateJavascript(let runDetails):
                    self.parent.evaluate(javascriptRunDetails: runDetails)
                }
            })
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        parent.store.canGoBack.send(webView.canGoBack)
        parent.store.canGoForward.send(webView.canGoForward)
        evaluateOutstandingJavascript()
    }
}
