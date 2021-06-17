//
//  AudiencesTests.swift
//  AudiencesTests
//
//  Created by Jonathon Albert on 07/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import XCTest
@testable import RealifeTech
@testable import Apollo

final class AudiencesTests: XCTestCase {

    func test_init_successful() {
        let spy = MockAudienceGraphQLManager()
        let sut = AudiencesImplementing(graphQLManager: spy)
        XCTAssertNotNil(sut.graphQLManager)
    }

    func test_deviceIsMemberOfAudience_isCalled() {
        let spy = MockAudienceGraphQLManager()
        let sut = AudiencesImplementing(graphQLManager: spy)
        sut.deviceIsMemberOfAudience(audienceId: "") { _ in }
        XCTAssertNotNil(sut.graphQLManager)
        XCTAssertTrue(spy.dispatchQueryIsCalled)
    }
}
