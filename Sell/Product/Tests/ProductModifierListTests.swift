//
//  ProductModifierListTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class ProductModifierListTests: XCTestCase {

    func test_initWithResponse_nonNilResponse_returnsValidValue() throws {
        let response = ApolloType.FragmentProduct.ModifierList(
            id: "1",
            status: nil,
            externalId: nil,
            reference: nil,
            multipleSelect: false,
            mandatorySelect: false,
            maxAllowed: 1,
            items: [makeModifierListItem()],
            translations: [
                ApolloType.FragmentProduct.ModifierList.Translation(
                    language: .en,
                    title: "A")
            ])
        let sut = try XCTUnwrap(ProductModifierList(response: response))
        XCTAssertEqual(sut.id, response.id)
        XCTAssertEqual(sut.multipleSelect, response.multipleSelect)
        XCTAssertEqual(sut.mandatorySelect, response.mandatorySelect)
        XCTAssertEqual(sut.maxAllowed, response.maxAllowed)
        XCTAssertEqual(
            sut.items?.first?.id,
            response.items?.first?.underlying?.fragments.fragmentProductModifierItem.id)
        XCTAssertEqual(
            sut.translations?.first?.title,
            response.translations?.first?.underlying?.title)
    }

    func test_initWithResponse_nilResponse_returnsNil() {
        XCTAssertNil(ProductModifierList(response: nil))
    }
}

private func makeModifierListItem() -> ApolloType.FragmentProduct.ModifierList.Item {
    var item = ApolloType.FragmentProduct.ModifierList.Item(unsafeResultMap: [:])
    item.fragments.fragmentProductModifierItem = ApolloType.FragmentProductModifierItem(id: "1")
    return item
}
