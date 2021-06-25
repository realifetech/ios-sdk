//
//  BasketError.swift
//  RealifeTech
//
//  Created by Mickey Lee on 24/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum BasketError: Error, LocalizedError {

    case outOfStock
    case priceChange
    case mixedBasket
    case emptyBasket
    case regularError(Error)

    public var errorDescription: String? {
        switch self {
        case .regularError(let error):
            return error.localizedDescription
        default:
            return localizedDescription
        }
    }
}
