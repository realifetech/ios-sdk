//
//  FulfilmentPointTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class FulfilmentPointTests: XCTestCase {

    func test_publicInitialiser() {
        let sut = FulfilmentPoint(
            id: "1",
            type: .collectWhenReady,
            imageUrl: nil,
            mapImageUrl: nil,
            lat: 10.00,
            long: 10.00,
            waitTime: 100,
            prepTime: 100,
            position: 1,
            translations: [
                FulfilmentPointTranslation(
                    language: "en",
                    title: "A",
                    description: "B",
                    collectionNote: "C",
                    collectionNotes: CollectionNotes(
                        preorder: "D",
                        checkin: "E")
                )],
            seatFormId: "1",
            categories: [
                FulfilmentPointCategory(
                    id: "1",
                    iconImageUrl: nil,
                    position: 2,
                    translations: [StandardTitleTranslation(language: "en", title: "A")]
                )],
            timeslots: [
                Timeslot(
                    id: "1",
                    startTime: Date().iso8601String,
                    endTime: Date(timeIntervalSinceNow: 3600).iso8601String,
                    translations: [
                        TimeslotTranslation(
                            language: "en",
                            title: "A",
                            description: "B",
                            collectionNote: "C")
                    ])
            ])
        XCTAssertEqual(sut.id, "1")
        XCTAssertEqual(sut.type, .collectWhenReady)
    }

    func test_initWithApolloFragment_nonNilResponse_returnValidValue() throws {
        let fragment = ApolloType.FragmentFulfilmentPoint(
            id: "1",
            externalId: nil,
            reference: nil,
            type: .collectWhenReady,
            status: nil,
            imageUrl: "A",
            mapImageUrl: "B",
            lat: 10.00,
            long: 10.00,
            waitTime: 10,
            prepTime: 10,
            position: 1,
            translations: [
                ApolloType.FragmentFulfilmentPoint.Translation(
                    language: .en,
                    title: "A",
                    description: "B",
                    collectionNote: "C",
                    collectionNotes: nil
                )],
            seatForm: makeForm(),
            categories: [makeCategory()],
            venue: nil,
            timeslots: [makeTimeslot()])
        let sut = try XCTUnwrap(FulfilmentPoint(response: fragment))
        XCTAssertEqual(sut.id, fragment.id)
        XCTAssertEqual(sut.type, .collectWhenReady)
        XCTAssertEqual(sut.imageUrl, fragment.imageUrl)
        XCTAssertEqual(sut.mapImageUrl, fragment.mapImageUrl)
        XCTAssertEqual(sut.lat, fragment.lat)
        XCTAssertEqual(sut.long, fragment.long)
        XCTAssertEqual(sut.waitTime, fragment.waitTime)
        XCTAssertEqual(sut.prepTime, fragment.prepTime)
        XCTAssertEqual(sut.position, fragment.position)
        XCTAssertEqual(sut.translations?.count, fragment.translations?.count)
        XCTAssertEqual(sut.seatFormId, fragment.seatForm?.fragments.fragmentForm.id)
        XCTAssertEqual(sut.categories?.count, fragment.categories?.count)
        XCTAssertEqual(sut.timeslots?.count, fragment.timeslots?.count)
    }

    func test_initWithApolloFragment_nilResponse_returnNil() {
        XCTAssertNil(FulfilmentPoint(response: nil))
    }
}

private func makeForm() -> ApolloType.FragmentFulfilmentPoint.SeatForm {
    var seatForm = ApolloType.FragmentFulfilmentPoint.SeatForm(unsafeResultMap: [:])
    seatForm.fragments.fragmentForm = ApolloType.FragmentForm(id: "1", translations: [])
    return seatForm
}

private func makeCategory() -> ApolloType.FragmentFulfilmentPoint.Category {
    var category = ApolloType.FragmentFulfilmentPoint.Category(unsafeResultMap: [:])
    category.fragments.fragmentFulfilmentPointCategory = ApolloType.FragmentFulfilmentPointCategory(
        id: "1",
        reference: nil,
        status: nil,
        iconImageUrl: nil,
        position: nil,
        createdAt: nil,
        updatedAt: nil,
        translations: [ApolloType.FragmentFulfilmentPointCategory.Translation(language: .en, title: "A")])
    return category
}

private func makeTimeslot() -> ApolloType.FragmentFulfilmentPoint.Timeslot {
    var timeslot = ApolloType.FragmentFulfilmentPoint.Timeslot(unsafeResultMap: [:])
    timeslot.fragments.fragmentTimeslot = ApolloType.FragmentTimeslot(id: "1")
    return timeslot
}
