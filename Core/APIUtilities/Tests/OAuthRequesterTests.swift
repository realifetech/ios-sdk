//
//  OAuthRequesterTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class OAuthRequesterTests: XCTestCase {

    private var sut: OAuthRequester.Type!

    override func setUp() {
        super.setUp()
        sut = OAuthRequester.self
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_dateFormat() throws {
        let (format, locale) = try XCTUnwrap(sut.dateFormat())
        XCTAssertEqual(format, "yyyy-MM-dd'T'HH:mm:ssZ")
        XCTAssertEqual(locale, "en_US_POSIX")
    }

    func test_preDispatchAction() {
        XCTAssertNil(sut.preDispatchAction())
    }

    func test_interceptors() {
        XCTAssertEqual(sut.interceptors()?.count, 4)
    }

    func test_requestInitialAccessToken() throws {
        sut.setDefaultOAuthParameters(clientId: "A", clientSecret: "B")
        let request = sut.requestInitialAccessToken()
        let httpBody = try XCTUnwrap(request.httpBody)
        let body = try JSONDecoder().decode([String: String].self, from: httpBody)
        XCTAssertEqual(body["grant_type"], "client_credentials")
        XCTAssertEqual(body["client_id"], "A_0")
        XCTAssertEqual(body["client_secret"], "B")
    }

    func test_refreshAccessToken() throws {
        sut.setDefaultOAuthParameters(clientId: "A", clientSecret: "B")
        let request = sut.refreshAccessToken("refresh")
        let httpBody = try XCTUnwrap(request.httpBody)
        let body = try JSONDecoder().decode([String: String].self, from: httpBody)
        XCTAssertEqual(body["grant_type"], "refresh_token")
        XCTAssertEqual(body["refresh_token"], "refresh")
        XCTAssertEqual(body["client_id"], "A_0")
        XCTAssertEqual(body["client_secret"], "B")
    }
}
