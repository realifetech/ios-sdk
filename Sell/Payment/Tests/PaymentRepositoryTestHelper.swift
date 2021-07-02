//
//  PaymentRepositoryTestHelper.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 01/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
@testable import RealifeTech

enum PaymentRepositoryTestHelper {

    static func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: PaymentRepository) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = PaymentRepository(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }
}

extension PaymentSourceInput {

    static var dummy: PaymentSourceInput {
        PaymentSourceInput(
            id: "1",
            billingDetails: nil,
            card: nil)
    }
}
