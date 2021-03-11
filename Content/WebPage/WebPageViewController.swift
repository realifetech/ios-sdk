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
    func getError(_: Error)
}

open class WebPageViewController: UIViewController {

    private let webPageCreator: WebPageCreatable
    private let type: WebPage.`Type`

    public weak var delegate: WebPageViewControllerDelegate?
    open lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    public init(
        webPageCreator: WebPageCreatable,
        type: WebPage.`Type`,
        delegate: WebPageViewControllerDelegate?
    ) {
        self.webPageCreator = webPageCreator
        self.type = type
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        fetchWebPage()
    }

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        cancelLoading()
    }

    private func setupWebView() {
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func fetchWebPage() {
        webPageCreator.getWebPage(forType: type) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let webPage):
                self.webView.load(URLRequest(url: webPage.url))
            case .failure(let error):
                self.delegate?.getError(error)
            }
        }
    }

    private func cancelLoading() {
        guard webView.isLoading else { return }
        webView.stopLoading()
    }
}
