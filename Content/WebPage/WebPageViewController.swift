//
//  WebPageViewController.swift
//  RealifeTech
//
//  Created by Mickey Lee on 02/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit
import WebKit

public protocol WebPageViewControllerDelegate: AnyObject {
    func webViewCanGoBack()
    func webViewCanGoForward()
    func webViewEstimatedProgressChanged(_ progress: Double)
    func urlForNavigationAction(_ url: URL?)
    func webViewDidStartProvisionalNavigation()
    func webViewDidFinishNavigation()
}

public class WebPageViewController: UIViewController {

    private let result: Result<WebPage, Error>
    weak var delegate: WebPageViewControllerDelegate?

    public lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        return webView
    }()

    public init(result: Result<WebPage, Error>, delegate: WebPageViewControllerDelegate?) {
        self.result = result
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("DEINIT")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        beginLoading()
    }

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        cancelLoading()
    }

    private func setupWebView() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func beginLoading() {
        switch result {
        case .success(let webPage):
            let request = URLRequest(url: webPage.url)
            webView.load(request)
            webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
            webView.addObserver(self, forKeyPath: #keyPath(WKWebView.canGoBack), options: .new, context: nil)
            webView.addObserver(self, forKeyPath: #keyPath(WKWebView.canGoForward), options: .new, context: nil)
        case .failure(let error):
            showAlertControllerAndCloseScene(title: error.localizedDescription)
        }
    }

    private func cancelLoading() {
        guard webView.isLoading else { return }
        webView.stopLoading()
        guard webView.observationInfo != nil else { return }
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.canGoBack))
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.canGoForward))
    }

    override public func observeValue(
        forKeyPath keyPath: String?,
        of object: Any?,
        change: [NSKeyValueChangeKey: Any]?,
        context: UnsafeMutableRawPointer?
    ) {
        if keyPath == #keyPath(WKWebView.canGoBack) {
            delegate?.webViewCanGoBack()
        } else if keyPath == #keyPath(WKWebView.canGoForward) {
            delegate?.webViewCanGoForward()
        } else if keyPath == #keyPath(WKWebView.estimatedProgress) {
            delegate?.webViewEstimatedProgressChanged(webView.estimatedProgress)
        }
    }

    private func showAlertControllerAndCloseScene(title: String?) {
        let alertController = UIAlertController(
            title: title,
            message: nil,
            preferredStyle: .alert)
        let closeAction = UIAlertAction(
            title: "CLOSE".localizedString,
            style: .default) { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(closeAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension WebPageViewController: WKUIDelegate, WKNavigationDelegate {

    public func webView(
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

    public func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        delegate?.urlForNavigationAction(navigationAction.request.url)
        decisionHandler(.allow)
    }

    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        delegate?.webViewDidStartProvisionalNavigation()
    }

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        delegate?.webViewDidFinishNavigation()
    }
}
