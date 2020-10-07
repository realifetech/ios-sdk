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

/// Getter/Setter for current token state & whether it is currently being refreshed.
protocol OAuthTokenRefreshWatchable {
    var ongoingTokenRefresh: Observable<Bool>? { get }
    func updateRefreshingStatus(newValue: OAuthTokenStatus)
}

enum OAuthTokenStatus {
    case valid, invalid, refreshing
}

class OAuthTokenRefreshWatcher: OAuthTokenRefreshWatchable {

    /// Returns the current token status.
    private var status: BehaviorRelay<OAuthTokenStatus>

    /// If the status is currently refreshing, this variable can be used to observe whether the refresh succeeds or fails.
    /// Returns nil when no refresh is taking place.
    var ongoingTokenRefresh: Observable<Bool>? {
        guard status.value == .refreshing else { return nil }
        print("👀 RefreshWatcher: Generating a refresh observable")
        // NOTE: Behaviour subjects always emit their current value, we only care about the next value, so we skip one.
        return status
            .asObservable()
            .skip(1)
            .take(1)
            .filter { $0 == .valid }
            .map { $0 == .valid }
    }

    init() {
        status = BehaviorRelay(value: .valid)
    }

    /// Sets the current token status, skipping values identical to the current one
    func updateRefreshingStatus(newValue: OAuthTokenStatus) {
        print("👀 RefreshWatcher: Updating refresh status to", newValue)
        guard status.value != newValue else { return }
        status.accept(newValue)
    }
}
