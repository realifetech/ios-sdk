//
//  ReachabilityHelper+Mock.swift
//  GeneralTests
//
//  Created by Olivier Butler on 16/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
@testable import RealifeTech

class MockReachabilityChecker: ReachabilityChecking {

    var isBluetoothConnected: Bool = false
    var isConnectedToWifi: Bool = false
    var hasNetworkConnection: Bool = false
}
