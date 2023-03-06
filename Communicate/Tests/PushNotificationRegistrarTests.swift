//
//  PushNotificationRegistrarTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 26/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
@testable import RealifeTech

final class PushNotificationRegistrarTests: XCTestCase {

    private var sut: PushNotificationRegistrar!
    private var tokenStore: MockStore!
    private var deviceRepository: MockDeviceRepository.Type!
    private var scheduler: TestScheduler!
    private let bag = DisposeBag()

    override func setUp() {
        super.setUp()
        tokenStore = MockStore()
        deviceRepository = MockDeviceRepository.self
        scheduler = TestScheduler(initialClock: 0)
        sut = PushNotificationRegistrar(
            subscriptionScheduler: scheduler,
            observationScheduler: scheduler,
            tokenStore: tokenStore,
            deviceRepository: deviceRepository)
    }

    override func tearDown() {
        sut = nil
        scheduler = nil
        deviceRepository.reset()
        deviceRepository = nil
        tokenStore = nil
        super.tearDown()
    }

    func test_initAndCheckAndSendStoredToken_hasStoredToken_deviceRepositoryGetsCalled() {
        tokenStore.hasStoredToken = true
        sut = PushNotificationRegistrar(
            subscriptionScheduler: scheduler,
            observationScheduler: scheduler,
            tokenStore: tokenStore,
            deviceRepository: deviceRepository)
        XCTAssertTrue(deviceRepository.getsCalled)
    }

    func test_initAndCheckAndSendStoredToken_hasNoStoredToken_doNothing() {
        tokenStore.hasStoredToken = false
        sut = PushNotificationRegistrar(
            subscriptionScheduler: scheduler,
            observationScheduler: scheduler,
            tokenStore: tokenStore,
            deviceRepository: deviceRepository)
        XCTAssertFalse(deviceRepository.getsCalled)
    }

    func test_registerForPushNotificationsWithToken_repoReturnsOnNext_tokenStoreDeletionGetsCalled() {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        let response = TokenRegistrationResponse(snsEndpoint: "sns")
        scheduler
            .createHotObservable([.next(10, response)])
            .bind(to: deviceRepository.tokenRegistrationReturns)
            .disposed(by: bag)
        sut.registerForPushNotifications(token: "A") { [self] result in
            guard case .success = result else {
                return XCTFail("Should go with success")
            }
            XCTAssertEqual(tokenStore.savedValue, "A")
            XCTAssertTrue(tokenStore.deleteGetsCalled)
            expectation.fulfill()
        }
        scheduler.start()
        wait(for: [expectation], timeout: 0.01)
    }

    func test_registerForPushNotificationsWithToken_repoReturnsOnError_callbackReturnsFailure() {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        scheduler
            .createHotObservable([.error(10, DummyError.failure)])
            .bind(to: deviceRepository.tokenRegistrationReturns)
            .disposed(by: bag)
        sut.registerForPushNotifications(token: "A") { result in
            guard case let .failure(error) = result else {
                return XCTFail("Should go with failure")
            }
            XCTAssertEqual(self.tokenStore.savedValue, "A")
            XCTAssertEqual(error as? DummyError, .failure)
            expectation.fulfill()
        }
        scheduler.start()
        wait(for: [expectation], timeout: 0.01)
    }

    func test_registerForPushNotificationsWithTokenData_repoReturnsOnNext_tokenStoreDeletionGetsCalled() throws {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        let response = TokenRegistrationResponse(snsEndpoint: "sns")
        scheduler
            .createHotObservable([.next(10, response)])
            .bind(to: deviceRepository.tokenRegistrationReturns)
            .disposed(by: bag)
        let data = try XCTUnwrap("hi".data(using: .utf8))
        sut.registerForPushNotifications(tokenData: data) { [self] result in
            guard case .success = result else {
                return XCTFail("Should go with success")
            }
            XCTAssertNotNil(tokenStore.savedValue)
            XCTAssertTrue(tokenStore.deleteGetsCalled)
            expectation.fulfill()
        }
        scheduler.start()
        wait(for: [expectation], timeout: 0.01)
    }

    func test_registerForPushNotificationsWithTokenData_repoReturnsOnError_callbackReturnsFailure() throws {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        scheduler
            .createHotObservable([.error(10, DummyError.failure)])
            .bind(to: deviceRepository.tokenRegistrationReturns)
            .disposed(by: bag)
        let data = try XCTUnwrap("hi".data(using: .utf8))
        sut.registerForPushNotifications(tokenData: data) { result in
            guard case let .failure(error) = result else {
                return XCTFail("Should go with failure")
            }
            XCTAssertNotNil(self.tokenStore.savedValue)
            XCTAssertEqual(error as? DummyError, .failure)
            expectation.fulfill()
        }
        scheduler.start()
        wait(for: [expectation], timeout: 0.01)
    }
}

private final class MockStore: Storeable {

    var hasStoredToken = false
    var deleteGetsCalled = false
    var savedValue: String?

    func fetchAll<Model: Decodable>() throws -> [Model] {
        []
    }

    func fetch<Model: Decodable>(for key: String) throws -> Model {
        if hasStoredToken {
            return try XCTUnwrap("string" as? Model)
        }
        throw DummyError.failure
    }

    func save<Model: Encodable>(_ value: Model, for key: String) throws {
        savedValue = value as? String
    }

    func delete(key: String) {
        deleteGetsCalled = true
    }
}

private struct MockDeviceRepository: DeviceProviding {

    static var tokenRegistrationReturns = PublishSubject<TokenRegistrationResponse>()
    static var getsCalled = false

    static func reset() {
        tokenRegistrationReturns = PublishSubject<TokenRegistrationResponse>()
        getsCalled = false
    }

    func registerDevice(_ device: Device) -> Observable<Bool> {
        .never()
    }

    static func registerForPushNotifications(with deviceToken: DeviceToken) -> Observable<TokenRegistrationResponse> {
        getsCalled = true
        return tokenRegistrationReturns.asObservable()
    }
}
