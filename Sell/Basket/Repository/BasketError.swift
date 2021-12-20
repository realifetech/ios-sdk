//
//  BasketError.swift
//  RealifeTech
//
//  Created by Mickey Lee on 24/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo

public struct BasketError: Error, LocalizedError {

    public enum `Type` {
        case outOfStock
        case priceChange
        case mixedBasket
        case emptyBasket
        case regularError(Error)
    }

    public let type: `Type`
    public let message: String

    public init(type: `Type`, message: String) {
        self.type = type
        self.message = message
    }

    public var errorDescription: String? {
        switch type {
        case .regularError(let error):
            return error.localizedDescription
        default:
            return message
        }
    }
}

extension BasketError {

    init(graphQLError: GraphQLError) {
        let message = graphQLError.message ?? graphQLError.localizedDescription
        switch graphQLError.extensions?["code"] as? String {
        case "SELL_BASKET_OUT_OF_STOCK":
            self = BasketError(type: .outOfStock, message: message)
        case "SELL_BASKET_PRICE_CHANGE":
            self = BasketError(type: .priceChange, message: message)
        case "SELL_BASKET_MIXED":
            self = BasketError(type: .mixedBasket, message: message)
        case "SELL_BASKET_EMPTY":
            self = BasketError(type: .emptyBasket, message: message)
        default:
            self = BasketError(type: .regularError(graphQLError), message: message)
        }
    }
}
