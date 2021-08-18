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
    var webViewNavigationPublisher = CurrentValueSubject<WebViewNavigation, Never>(.initial)
    var canGoBack = CurrentValueSubject<Bool, Never>(false)
    var canGoForward = CurrentValueSubject<Bool, Never>(false)
}

enum WebViewNavigation {
    case initial
    case backward
    case forward
    case reload
}
