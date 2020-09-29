//
//  ReachabilityFactory.swift
//  ReachabilityChecker
//
//  Created by Jonathon Albert on 24/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public struct ReachabilityFactory {

    func makeReachabilityHelper() -> ReachabilityChecking {
        return ReachabilityChecker()
    }
}
