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
    case regularErrors([Error])

    public var errorDescription: String? {
        switch self {
        case .regularErrors(let errors):
            return errors.compactMap { $0.localizedDescription }.joined(separator: "\n")
        default:
            return localizedDescription
        }
    }
}
