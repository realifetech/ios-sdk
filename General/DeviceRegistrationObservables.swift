//
//  DeviceRegistrationObservables.swift
//  General
//
//  Created by Olivier Butler on 15/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Repositories

/// Allows us to observe device registration success and failure. Failures will only be emitted after a threshold time has elapsed.
struct DeviceRegistrationObservables {
    /// Emits an event when we have failed registration and enough time has elapsed to retry.
    /// Is always true.
    let retryObservable: Observable<Bool>
    /// Emits an event whenever device registration has succeeded.
    /// Is always true.
    let successObservable: Observable<Bool>

    init
}
