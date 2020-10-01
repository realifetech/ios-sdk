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

    /// If the status is currently refreshing, this variable can be used to observe whether the refresh succeeds or fails.
    var refreshSuccessfulIfRefreshing: Observable<Bool>? {
        guard status.value == .refreshing else { return nil }
        // We skip the first result to avoid immediately firing (behaviour subjects always emit their last value, which would be 'refreshing' in this case).
        // TODO: Look into if we should be returning Bool here. We never return false and will only ever complete at all for successes.
        return status.asObservable().skip(1).filter { $0 == .valid }.map { $0 == .valid }
    }

    init() {
        status = BehaviorRelay(value: .valid)
    }

    func updateRefreshingStatus(newValue: OAuthTokenStatus) {
        guard status.value != newValue else { return }
        status.accept(newValue)
    }
}
