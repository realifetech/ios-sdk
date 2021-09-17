//
//  HostAppAuthenticatorTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 17/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class HostAppAuthenticatorTests: XCTestCase {

    func testGenerateSignature() {
        let sut = HostAppAuthenticator()
        let userInfo = HostAppUserInfo(emailAddress: "user@test.com", firstName: "first", lastName: "last")
        let salt = "abc123"
        let signature = sut.generateUserInfoSignature(userInfo: userInfo, salt: salt)
        let shaHash = "7614244E2ADE7000CCC7FBDE88839F48EEB86EE91B70E208BD3A92C7C93A3138"
        XCTAssert(signature == shaHash)
    }
}
