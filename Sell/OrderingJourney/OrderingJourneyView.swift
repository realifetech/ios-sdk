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

    var dismiss: (() -> Void)?

    public let urlRequest: URLRequest
    public let colorStore: ColorStorable

    public init(urlString: String, colorStore: ColorStorable) {
        guard let url = URL(string: urlString) else {
            fatalError("Fail to construct URL")
        }
        self.urlRequest = URLRequest(url: url)
        self.colorStore = colorStore
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
                    .background(colorStore.getColor(for: .primary))
            }
            .navigationBarItems(
                leading: AnyView(makeCloseButton()),
                trailing: AnyView(makeReloadButton())
            )
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarColor(
                backgroundColor: colorStore.getColor(for: .primary),
                titleColor: colorStore.getColor(for: .onPrimary))
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
            .foregroundColor(colorStore.getColor(for: .onPrimary))
            .disabled(!canGoBack)

            Button {
                store.webViewNavigationPublisher.send(.forward)
            } label: {
                Image(systemName: "chevron.right")
            }
            .foregroundColor(colorStore.getColor(for: .onPrimary))
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
        OrderingJourneyView(urlString: "https://www.realifetech.com/", colorStore: PreviewColorStore())
    }
}
