//
//  OrderingJourneyView.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI
import WebKit

public struct OrderingJourneyView: View {

    @ObservedObject var store = WebViewStore()
    @State private var canGoBack = false
    @State private var canGoForward = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    // NOTE: This is only assigned from UIHostController
    // as the presentationMode doesn't support dismissing from UIKit until iOS 15.
    // swiftlint:disable:next line_length
    // https://developer.apple.com/documentation/ios-ipados-release-notes/ios-ipados-15-beta-release-notes#Updates-in-iOS-&-iPadOS-15-beta
    var dismiss: (() -> Void)?

    public let urlRequest: URLRequest
    public let colorStore: ColorStorable
    private let scheduler: DispatchQueueAnyScheduler
    private var webViewWrapper: WebViewWrapper!
    let inspection = Inspection<Self>()

    init(urlString: String, colorStore: ColorStorable, scheduler: DispatchQueueAnyScheduler) {
        let url = URL(string: urlString) ?? URL(fileURLWithPath: "")
        self.urlRequest = URLRequest(url: url)
        self.colorStore = colorStore
        self.scheduler = scheduler
    }

    public init(urlString: String, colorStore: ColorStorable) {
        let url = URL(string: urlString) ?? URL(fileURLWithPath: "")
        self.urlRequest = URLRequest(url: url)
        self.colorStore = colorStore
        self.scheduler = .main
    }

    private func createWebViewWrapper() -> WebViewWrapper {
        return WebViewWrapper(
            webView: WKWebView(),
            urlRequest: urlRequest,
            store: store)
    }

    public var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                createWebViewWrapper()
                AnyView(makeBottomView())
            }
            .navigationBarItems(
                leading: AnyView(makeCloseButton()),
                trailing: AnyView(makeReloadButton())
            )
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarColor(
                backgroundColor: colorStore.getColor(for: .primary),
                titleColor: colorStore.getColor(for: .onPrimary))
            .onReceive(store.canGoBack.receive(on: scheduler)) { value in
                canGoBack = value
            }
            .onReceive(store.canGoForward.receive(on: scheduler)) { value in
                canGoForward = value
            }
        }
    }
}

private extension OrderingJourneyView {

    func makeBottomView() -> some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 16) {
                Button {
                    store.webViewNavigationPublisher.send(.backward)
                } label: {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(getButtonColor(by: canGoBack))
                .onReceive(inspection.notice) { inspection.visit(self, $0) }
                .disabled(!canGoBack)

                Button {
                    store.webViewNavigationPublisher.send(.forward)
                } label: {
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(getButtonColor(by: canGoForward))
                .onReceive(inspection.notice) { inspection.visit(self, $0) }
                .disabled(!canGoForward)

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(colorStore.getColor(for: .surface).edgesIgnoringSafeArea(.bottom))
        }
    }

    func getButtonColor(by state: Bool) -> Color {
        return colorStore.getColor(for: state ? .onSurface : .neutral)
    }

    func makeCloseButton() -> some View {
        Button {
            dismiss?() ?? presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "xmark")
        }
        .foregroundColor(colorStore.getColor(for: .onPrimary))
    }

    func makeReloadButton() -> some View {
        Button {
            store.webViewNavigationPublisher.send(.reload)
        } label: {
            Image(systemName: "arrow.clockwise")
        }
        .foregroundColor(colorStore.getColor(for: .onPrimary))
    }
}

struct OrderingJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        OrderingJourneyView(urlString: "https://www.realifetech.com/", colorStore: EmptyColorStore())
    }
}

public protocol OrderingJourneyViewUpdatable {
    func evaluate(javascript: String, completion: ((Any?, Error?) -> Void)?)
    func reload()
}

extension OrderingJourneyView: OrderingJourneyViewUpdatable {
    public func evaluate(javascript: String, completion: ((Any?, Error?) -> Void)?) {
        webViewWrapper.evaluate(javascript: javascript, completion: completion)
    }

    public func reload() {
        webViewWrapper.reload()
    }
}
