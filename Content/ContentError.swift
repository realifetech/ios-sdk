//
//  ContentError.swift
//  RealifeTech
//
//  Created by Mickey Lee on 02/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

enum ContentError: Error, LocalizedError {
    case urlIsEmpty
    case constructUrlFailure

    var errorDescription: String? {
        switch self {
        case .urlIsEmpty:
            return "EMPTY_URL_ERROR_MESSAGE".contentLocalizedString
        case .constructUrlFailure:
            return "CONSTRUCT_URL_ERROR_MESSAGE".contentLocalizedString
        }
    }
}
