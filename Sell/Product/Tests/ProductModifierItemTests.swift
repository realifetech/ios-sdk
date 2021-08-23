//
//  ProductModifierItemTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class ProductModifierItemTests: XCTestCase {

    func test_initWithFragment_nonNilResponse_returnsValidValue() throws {
        let fragment = ApolloType.FragmentProductModifierItem(
            id: "1",
            status: nil,
            externalId: nil,
            additionalPrice: 100,
            position: 1,
            translations: [
                ApolloType.FragmentProductModifierItem.Translation(
                    language: .en,
                    title: "A")
            ])
        let sut = try XCTUnwrap(ProductModifierItem(response: fragment))
        XCTAssertEqual(sut.id, fragment.id)
        XCTAssertEqual(sut.additionalPrice, fragment.additionalPrice)
        XCTAssertEqual(
            sut.translations?.first?.language,
            fragment.translations?.first?.underlying?.language?.rawValue)
        XCTAssertEqual(
            sut.translations?.first?.title,
            fragment.translations?.first?.underlying?.title)
    }

    func test_initWithFragment_nilResponse_returnsNil() {
        XCTAssertNil(ProductModifierItem(response: nil))
    }
}
