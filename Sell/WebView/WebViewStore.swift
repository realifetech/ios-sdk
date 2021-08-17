//
//  WebViewStore.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Combine

final class WebViewStore: ObservableObject {
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
    var canGoBack = PassthroughSubject<Bool, Never>()
    var canGoForward = PassthroughSubject<Bool, Never>()
}

enum WebViewNavigation {
    case backward
    case forward
    case reload
}
