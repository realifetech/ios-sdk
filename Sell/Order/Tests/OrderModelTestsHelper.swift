//
//  OrderModelTestsHelper.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL
@testable import RealifeTech

enum OrderModelTestsHelper {

    static let orderStateString = "order state"
    static let paymentStatusString = "payment status"

    static func makeFragmentOrder(with id: String = "1", hasItems: Bool = true) -> ApolloType.FragmentOrder {
        ApolloType.FragmentOrder(
            id: id,
            orderNumber: id,
            qrCodeUrl: "A",
            collectionDate: Date().iso8601String,
            status: .inProgress,
            state: ApolloType.FragmentOrder.State(
                workingState: orderStateString,
                status: orderStateString,
                translations: [
                    ApolloType.FragmentOrder.State.Translation(
                        language: "en",
                        title: orderStateString,
                        description: orderStateString)
                ]),
            paymentStatus: ApolloType.PaymentOrderStatus(rawValue: paymentStatusString),
            grossAmount: 10,
            discountAmount: 10,
            netAmount: 100,
            estimatedAt: Date(timeIntervalSinceNow: 3600).iso8601String,
            createdAt: Date().iso8601String,
            updatedAt: nil,
            items:
                hasItems
                ? ["1", "2"].map { makeOrderItem(with: $0) }
                : nil,
            orderNotes: nil,
            timeslot: nil,
            fulfilmentPoint: nil,
            user: nil,
            collectionPreferenceType: .asap,
            seatInfo: nil)
    }

    static func makeOrderItem(with id: String) -> ApolloType.FragmentOrder.Item {
        var modifierItemSelection = ApolloType.FragmentOrder.Item.ProductModifierItem(unsafeResultMap: [:])
        modifierItemSelection.fragments.fragmentProductModifierItemSelection = ApolloType
            .FragmentProductModifierItemSelection(
                productModifierItem: nil,
                quantity: 1,
                totalPrice: 100)
        return ApolloType.FragmentOrder.Item(
            id: id,
            product: nil,
            productVariant: nil,
            fulfilmentPoint: nil,
            productModifierItems: [modifierItemSelection],
            price: 100,
            modifierItemsPrice: 10,
            quantity: 1,
            totalPrice: 100,
            title: "title",
            subtitle: "subtitle",
            imageUrl: "imageUrl")
    }

}
