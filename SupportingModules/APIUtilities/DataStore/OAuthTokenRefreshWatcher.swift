//
//  OAuthTokenRefreshWatcher.swift
//  CLArena
//
//  Created by Ross Patman on 18/03/2019.
//  Copyright © 2019 ConcertLive. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class OAuthTokenRefreshWatcher {

    enum OAuthTokenStatus {
        case valid, invalid, refreshing
    }

    static let shared = OAuthTokenRefreshWatcher()

    fileprivate var status: BehaviorRelay<OAuthTokenStatus>

    var refreshSuccessfulIfRefreshing: Observable<Bool>? {
        guard status.value == .refreshing else { return nil }
        return status.asObservable().skip(1).filter { $0 == .valid }.map { $0 == .valid }   //we skip the first to stop firing on init
    }

    init() {
        status = BehaviorRelay(value: .valid)
    }

    func updateRefreshingStatus(newValue: OAuthTokenStatus) {
        guard status.value != newValue else { return }
        status.accept(newValue)
    }
}
