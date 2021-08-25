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

    @ObservedObject private var store = WebViewStore()
    @State private var canGoBack = false
    @State private var canGoForward = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    // NOTE: This is only assigned from UIHostController
    // as the presentationMode doesn't support dismissing from UIKit until iOS 15.
    // swiftlint:disable:next line_length
    // https://developer.apple.com/documentation/ios-ipados-release-notes/ios-ipados-15-beta-release-notes#Updates-in-iOS-&-iPadOS-15-beta
    var dismiss: (() -> Void)?

    public let urlRequest: URLRequest

    public init(urlString: String) {
        guard let url = URL(string: urlString) else {
            fatalError("Fail to construct URL")
        }
        self.urlRequest = URLRequest(url: url)
    }

    public var body: some View {
        NavigationView {
            VStack {
                WebViewWrapper(
                    webView: WKWebView(),
                    urlRequest: urlRequest,
                    store: store)
                Spacer()
                AnyView(makeBottomView())
                    .frame(height: 44)
            }
            .navigationBarItems(
                leading: AnyView(makeCloseButton()),
                trailing: AnyView(makeReloadButton())
            )
            .navigationBarTitle("", displayMode: .inline)
            .onReceive(store.canGoBack.receive(on: DispatchQueue.main)) { value in
                canGoBack = value
            }
            .onReceive(store.canGoForward.receive(on: DispatchQueue.main)) { value in
                canGoForward = value
            }
        }
    }
}

private extension OrderingJourneyView {

    func makeBottomView() -> some View {
        HStack(alignment: .center, spacing: 16) {
            Spacer()
                .frame(width: 16)

            Button {
                store.webViewNavigationPublisher.send(.backward)
            } label: {
                Image(systemName: "chevron.left")
            }
            .disabled(!canGoBack)

            Button {
                store.webViewNavigationPublisher.send(.forward)
            } label: {
                Image(systemName: "chevron.right")
            }
            .disabled(!canGoForward)

            Spacer()
        }
    }

    func makeCloseButton() -> some View {
        Button {
            dismiss?() ?? presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "xmark")
        }
    }

    func makeReloadButton() -> some View {
        Button {
            store.webViewNavigationPublisher.send(.reload)
        } label: {
            Image(systemName: "arrow.clockwise")
        }
    }
}

struct OrderingJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        OrderingJourneyView(urlString: "https://www.realifetech.com/")
    }
}
