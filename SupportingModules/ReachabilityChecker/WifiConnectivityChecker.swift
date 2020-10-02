//
//  WifiConnectivityChecker.swift
//  RealifeTech-SDK
//
//  Created by Jonathon Albert on 25/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import SystemConfiguration

public class WifiConnectivityChecker {

    var wifiConnected: Bool {
        return connectionStatus
    }

    private var reachabilityTarget: SCNetworkReachability? {
        var zeroAddress = sockaddr_in(sin_len: 0,
                                      sin_family: 0,
                                      sin_port: 0,
                                      sin_addr: in_addr(s_addr: 0),
                                      sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        return defaultRouteReachability
    }

    private var connectionStatus: Bool {
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        guard let target = reachabilityTarget, SCNetworkReachabilityGetFlags(target, &flags) else { return false }
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        return (isReachable && !needsConnection)
    }
}
