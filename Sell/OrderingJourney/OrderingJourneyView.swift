//
//  OrderingJourneyView.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI
import WebKit

public class OrderingJourneyViewModel: ObservableObject {
    @Published private(set) var canGoBack = false
    @Published private(set) var canGoForward = false

    func updateCanGoBack(with value: Bool) {
        canGoBack = value
    }

    func updateCanGoForward(with value: Bool) {
        canGoForward = value
    }
}

public struct OrderingJourneyView: View {

    @ObservedObject var store = WebViewStore()
    @ObservedObject private var viewModel = OrderingJourneyViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    // NOTE: This is only assigned from UIHostController
    // as the presentationMode doesn't support dismissing from UIKit until iOS 15.
    // swiftlint:disable:next line_length
    // https://developer.apple.com/documentation/ios-ipados-release-notes/ios-ipados-15-beta-release-notes#Updates-in-iOS-&-iPadOS-15-beta
    var dismiss: (() -> Void)?

    public let urlRequest: URLRequest
    public let colorStore: ColorStorable
    private let scheduler: DispatchQueueAnyScheduler
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

    public var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                WebViewWrapper(
                    webView: WKWebView(),
                    urlRequest: urlRequest,
                    store: store)
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
                viewModel.updateCanGoBack(with: value)
            }
            .onReceive(store.canGoForward.receive(on: scheduler)) { value in
                viewModel.updateCanGoForward(with: value)
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
                .foregroundColor(getButtonColor(by: viewModel.canGoBack))
                .onReceive(inspection.notice) { inspection.visit(self, $0) }
                .disabled(!viewModel.canGoBack)

                Button {
                    store.webViewNavigationPublisher.send(.forward)
                } label: {
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(getButtonColor(by: viewModel.canGoForward))
                .onReceive(inspection.notice) { inspection.visit(self, $0) }
                .disabled(!viewModel.canGoForward)

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
