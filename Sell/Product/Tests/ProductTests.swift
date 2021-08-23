//
//  ProductTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class ProductTests: XCTestCase {

    private let dummyTranslation = StandardTitleTranslation(language: "en", title: "dummy")

    func test_publicInitialiser() {
        let sut = Product(
            id: "1",
            images: [ProductImage(imageUrl: "url", position: 1)],
            modifierLists: [
                ProductModifierList(
                    id: "1",
                    multipleSelect: false,
                    mandatorySelect: false,
                    maxAllowed: 1,
                    items: [
                        ProductModifierItem(
                            id: "1",
                            additionalPrice: 100,
                            translations: [dummyTranslation])],
                    translations: [dummyTranslation])
            ],
            variants: [
                ProductVariant(
                    id: "1",
                    price: 100,
                    translations: [dummyTranslation])
            ],
            categories: [
                ProductCategory(
                    id: "1",
                    position: 1,
                    translations: [dummyTranslation])
            ],
            fulfilmentPoints: nil,
            translations: nil)
        XCTAssertEqual(sut.id, "1")
        XCTAssertEqual(sut.images?.first?.imageUrl, "url")
        XCTAssertEqual(sut.modifierLists?.first?.id, "1")
        XCTAssertEqual(sut.variants?.first?.id, "1")
        XCTAssertEqual(sut.categories?.first?.id, "1")
    }

    func test_initWithFragment_nonNilResponse_returnsValidValue() throws {
        let fragment = makeProductFragment()
        let sut = try XCTUnwrap(Product(response: fragment))
        XCTAssertEqual(sut.id, fragment.id)
        XCTAssertEqual(
            sut.images?.first?.imageUrl,
            fragment.images?.first?.underlying?.imageUrl)
        XCTAssertEqual(
            sut.modifierLists?.first?.id,
            fragment.modifierLists?.first?.underlying?.id)
        XCTAssertEqual(
            sut.variants?.first?.id,
            fragment.variants?.first?.underlying?.fragments.fragmentProductVariant.id)
        XCTAssertEqual(
            sut.categories?.first?.id,
            fragment.categories?.first?.underlying?.id)
        XCTAssertEqual(
            sut.fulfilmentPoints?.first?.id,
            fragment.fulfilmentPoints?.first?.underlying?.fragments.fragmentFulfilmentPoint.id)
        XCTAssertEqual(
            sut.translations?.first?.title,
            fragment.translations?.first?.underlying?.title)
    }

    func test_initWithFragment_nilResponse_returnsNil() {
        XCTAssertNil(Product(response: nil))
    }
}

private func makeProductFragment() -> ApolloType.FragmentProduct {
    ApolloType.FragmentProduct(
        id: "1",
        status: nil,
        reference: nil,
        externalId: nil,
        images: [
            ApolloType.FragmentProduct.Image(
                imageUrl: "url",
                position: 1)
        ],
        modifierLists: [
            ApolloType.FragmentProduct.ModifierList(id: "1")
        ],
        variants: [makeProductVariant()],
        categories: [makeProductCategory()],
        fulfilmentPoints: [makeFulfilmentPoint()],
        translations: [makeProductTranlation()])
}

private func makeProductVariant() -> ApolloType.FragmentProduct.Variant {
    var variant = ApolloType.FragmentProduct.Variant(unsafeResultMap: [:])
    variant.fragments.fragmentProductVariant = ApolloType.FragmentProductVariant(
        id: "1",
        externalId: nil,
        price: 100,
        createdAt: nil,
        updatedAt: nil,
        translations: [
            ApolloType.FragmentProductVariant.Translation(title: "A", language: .en)
        ])
    return variant
}

private func makeProductCategory() -> ApolloType.FragmentProduct.Category {
    ApolloType.FragmentProduct.Category(
        id: "1",
        externalId: nil,
        reference: nil,
        status: nil,
        position: 1,
        translations: [ApolloType.FragmentProduct.Category.Translation(language: .en, title: "A")])
}

private func makeFulfilmentPoint() -> ApolloType.FragmentProduct.FulfilmentPoint {
    var fulfilmentPoint = ApolloType.FragmentProduct.FulfilmentPoint(unsafeResultMap: [:])
    fulfilmentPoint.fragments.fragmentFulfilmentPoint = ApolloType.FragmentFulfilmentPoint(id: "1")
    return fulfilmentPoint
}

private func makeProductTranlation() -> ApolloType.FragmentProduct.Translation {
    ApolloType.FragmentProduct.Translation(
        id: "1",
        language: "en",
        title: "A",
        description: "B")
}
