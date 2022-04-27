//
//  StandardError.swift
//  SampleApp
//
//  Created by YOU-HSUAN YU on 2022/4/27.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation

enum StandardError: LocalizedError {
    case deviceNotRegistration

    var errorDescription: String? {
        switch self {
        case .deviceNotRegistration:
            return "Device requires registration."
        }
    }
}
