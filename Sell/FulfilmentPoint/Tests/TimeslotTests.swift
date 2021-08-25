//
//  TimeslotTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class TimeslotTests: XCTestCase {

    func test_initWithApolloFragment_nonNilResponse_returnValidValue() throws {
        let fragment = ApolloType.FragmentTimeslot(
            id: "1",
            externalId: nil,
            reference: nil,
            startTime: Date().iso8601String,
            endTime: Date().iso8601String,
            createdAt: nil,
            updatedAt: nil,
            translations: [
                ApolloType.FragmentTimeslot.Translation(
                    language: .en,
                    title: "A",
                    description: "B",
                    collectionNote: "C")
            ])
        let sut = try XCTUnwrap(Timeslot(response: fragment))
        XCTAssertEqual(sut.id, fragment.id)
        XCTAssertEqual(sut.startTime, fragment.startTime)
        XCTAssertEqual(sut.endTime, fragment.endTime)
        XCTAssertEqual(sut.translations?.count, fragment.translations?.count)
    }

    func test_initWithApolloFragment_nilResponse_returnNil() {
        XCTAssertNil(Timeslot(response: nil))
    }
}
