//
//  PaymentSourceTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

private let dummyAddress = "address"

final class PaymentSourceTests: XCTestCase {

    func test_publicInitialiser() {
        let sut = PaymentSource(
            id: "1",
            type: .card,
            isDefault: false,
            billingDetails: PaymentSourceBillingDetails(
                address: PaymentSourceBillingDetails.Address(
                    city: dummyAddress,
                    country: dummyAddress,
                    line1: dummyAddress,
                    line2: dummyAddress,
                    postalCode: dummyAddress,
                    state: dummyAddress),
                email: "A",
                name: "B",
                phone: "C"),
            card: nil)
        XCTAssertEqual(sut.id, "1")
        XCTAssertEqual(sut.type, .card)
        XCTAssertFalse(sut.isDefault)
        XCTAssertNotNil(sut.billingDetails)
    }

    func test_initWithFragment_nonNilResponse_returnsValidValue() throws {
        let fragment = ApolloType.FragmentPaymentSource(
            id: "1",
            type: .__unknown(""),
            default: true,
            billingDetails: ApolloType.FragmentPaymentSource.BillingDetail(
                address: ApolloType.FragmentPaymentSource.BillingDetail.Address(
                    city: dummyAddress,
                    country: dummyAddress,
                    line1: dummyAddress,
                    line2: dummyAddress,
                    postalCode: dummyAddress,
                    state: dummyAddress),
                email: "A",
                name: "B",
                phone: "C"),
            card: nil)
        let sut = try XCTUnwrap(PaymentSource(response: fragment))
        XCTAssertEqual(sut.id, fragment.id)
        XCTAssertEqual(sut.type, .card)
        XCTAssertEqual(sut.isDefault, fragment.default)
        XCTAssertEqual(sut.billingDetails?.address?.city, fragment.billingDetails?.address?.city)
        XCTAssertEqual(sut.billingDetails?.email, fragment.billingDetails?.email)
        XCTAssertEqual(sut.billingDetails?.name, fragment.billingDetails?.name)
        XCTAssertEqual(sut.billingDetails?.phone, fragment.billingDetails?.phone)
    }

    func test_initWithFragment_nilResponse_returnsNil() {
        XCTAssertNil(PaymentSource(response: nil))
    }
}

final class PaymentSourceBillingDetailsTests: XCTestCase {

    func test_apolloInput() {
        let sut = PaymentSourceBillingDetails(
            address: PaymentSourceBillingDetails.Address(
                city: dummyAddress,
                country: dummyAddress,
                line1: dummyAddress,
                line2: dummyAddress,
                postalCode: dummyAddress,
                state: dummyAddress),
            email: "A",
            name: "B",
            phone: "C")
        XCTAssertEqual(sut.apolloInput.address?.underlying?.city, sut.address?.city)
        XCTAssertEqual(sut.apolloInput.address?.underlying?.country, sut.address?.country)
        XCTAssertEqual(sut.apolloInput.address?.underlying?.line1, sut.address?.line1)
        XCTAssertEqual(sut.apolloInput.address?.underlying?.line2, sut.address?.line2)
        XCTAssertEqual(sut.apolloInput.address?.underlying?.postalCode, sut.address?.postalCode)
        XCTAssertEqual(sut.apolloInput.address?.underlying?.state, sut.address?.state)
        XCTAssertEqual(sut.apolloInput.email, sut.email)
        XCTAssertEqual(sut.apolloInput.name, sut.name)
        XCTAssertEqual(sut.apolloInput.phone, sut.phone)
    }
}
