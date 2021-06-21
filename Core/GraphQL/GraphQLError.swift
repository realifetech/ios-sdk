//
//  SellError.swift
//  RealifeTech
//
//  Created by Mickey Lee on 21/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum GraphQLError: Error, LocalizedError {
    case noDataError

    public var errorDescription: String? {
        switch self {
        case .noDataError:
            return "UNPARSEABLE_ERROR".coreLocalizedString
        }
    }
}
