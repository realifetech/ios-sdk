//
//  RegistrationStatusWatcher.swift
//  General
//
//  Created by Olivier Butler on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol RegistrationStatusWatchable {
    var ongoingTokenRefresh: Observable<Bool>? { get }
    func updateRefreshingStatus(newValue: RegistrationStatus)
}

class RegistrationStatusWatcher: RegistrationStatusWatchable {
    
    /// Returns the current token status.
    private var status: BehaviorRelay<RegistrationStatus>

    /// If the status is currently refreshing, this variable can be used to observe whether the refresh succeeds or fails.
    /// Returns nil when no refresh is taking place.
    var ongoingTokenRefresh: Observable<Bool>? {
        guard status.value == .registering else { return nil }
        // NOTE: Behaviour subjects always emit their current value, we only care about the next value, so we skip one.
        return status
            .asObservable()
            .skip(1)
            .filter { $0 == .registered }
            .map { $0 == .registered }
    }

    init(tokenStatusSource: BehaviorRelay<RegistrationStatus>? = nil) {
        status = tokenStatusSource ?? BehaviorRelay(value: .unknown)
    }

    /// Sets the current token status, skipping values identical to the current one
    func updateRefreshingStatus(newValue: RegistrationStatus) {
        guard status.value != newValue else { return }
        status.accept(newValue)
    }
}
