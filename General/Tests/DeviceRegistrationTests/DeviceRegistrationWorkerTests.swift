//
//  DeviceRegistrationWorkerTests.swift
//  GeneralTests
//
//  Created by Olivier Butler on 15/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
@testable import RealifeTech

final class DeviceRegistrationWorkerTests: XCTestCase {

    private enum TestError: Error, Equatable {
        case registrationError(String)
    }

    private var bag = DisposeBag()
    private let testId = "123abc"
    private let testModel = "whooze"
    private let osVersion = "dunny"
    private let sdkVersion = "mittens"
    private lazy var staticInformation = StaticDeviceInformation(
        deviceId: testId,
        deviceModel: testModel,
        osVersion: osVersion,
        sdkVersion: sdkVersion)

    private var sut: DeviceRegistrationWorker!
    private var reachabilityChecker: MockReachabilityChecker!
    private var deviceRepository: MockDeviceRepository.Type!
    private var store: MockCodableStore!
    private var scheduler: TestScheduler!

    override func setUp() {
        reachabilityChecker = MockReachabilityChecker()
        deviceRepository = MockDeviceRepository.self
        store = MockCodableStore()
        // Real time [sec]/resolution = virtual time [ticks]
        scheduler = TestScheduler(initialClock: 0, resolution: 0.001)
        let staticInformation = StaticDeviceInformation(
            deviceId: testId,
            deviceModel: testModel,
            osVersion: osVersion,
            sdkVersion: sdkVersion)
        sut = DeviceRegistrationWorker(
            staticDeviceInformation: staticInformation,
            reachabilityChecker: reachabilityChecker,
            deviceProvider: deviceRepository,
            deviceRegistrationMaxAttempts: 1,
            retryRegistrationInterval: 0.01, // 0.01 seconds = 10 milliseconds
            store: store ,
            subscriptionScheduler: scheduler,
            observationScheduler: scheduler)
    }

    override func tearDown() {
        scheduler = nil
        store = nil
        deviceRepository.reset()
        deviceRepository = nil
        reachabilityChecker = nil
        sut = nil
        super.tearDown()
    }

    func test_initialisation() {
        XCTAssertEqual(sut.deviceId, testId)
    }

    func test_initialisation_readsFromStore() {
        store.valueToReturn = true
        let sutWithCustomStore = DeviceRegistrationWorker(
            staticDeviceInformation: staticInformation,
            reachabilityChecker: reachabilityChecker,
            deviceProvider: deviceRepository,
            deviceRegistrationMaxAttempts: 1,
            retryRegistrationInterval: 1,
            store: store ,
            subscriptionScheduler: scheduler,
            observationScheduler: scheduler)
        XCTAssertTrue(sutWithCustomStore.sdkReady)
    }

    func test_registerDevice_successInTheFirstTime_sdkIsReadyAndSaveToStore() {
        XCTAssertFalse(sut.sdkReady)
        let observable: TestableObservable<Bool> = scheduler
            .createColdObservable([.next(10, true)])
        let expectation = XCTestExpectation(description: "Completion handler gets called")
        sut.registerDevice { [self] in
            XCTAssertNotNil(store.valueSaved)
            XCTAssertTrue(sut.sdkReady)
            expectation.fulfill()
        }
        observable
            .bind(to: deviceRepository.registerDevice)
            .disposed(by: bag)
        scheduler.start()
        wait(for: [expectation], timeout: 0.02)
    }

    func test_registerDevice_failureExceedsRetryTimes_sdkIsNotReadyAndNotSaveToStore() {
        let observable: TestableObservable<Bool> = scheduler
            .createHotObservable([.error(10, TestError.registrationError("error"))])
        let expectation = XCTestExpectation(description: "Completion handler gets called")
        sut.registerDevice { [self] in
            XCTAssertNil(store.valueSaved)
            XCTAssertFalse(sut.sdkReady)
            expectation.fulfill()
        }
        observable
            .bind(to: deviceRepository.registerDevice)
            .disposed(by: bag)
        let retryFirstTimeExpectation = XCTestExpectation(description: "Retry first time (attempt = 0)")
        scheduler.scheduleAt(20) {
            retryFirstTimeExpectation.fulfill()
        }
        let retrySecondimeExpectation = XCTestExpectation(description: "Retry second time (attempt = 1)")
        scheduler.scheduleAt(30) {
            retrySecondimeExpectation.fulfill()
        }
        scheduler.start()
        wait(for: [retryFirstTimeExpectation, retrySecondimeExpectation, expectation], timeout: 0.05)
    }
}

private struct MockDeviceRepository: DeviceProviding {

    static var registerDevice = PublishSubject<Bool>()

    static func reset() {
        registerDevice = PublishSubject<Bool>()
    }

    static func registerDevice(_ device: Device) -> Observable<Bool> {
        return registerDevice.asObservable()
    }

    static func registerForPushNotifications(with deviceToken: DeviceToken) -> Observable<TokenRegistrationResponse> {
        return .never()
    }
}

private final class MockCodableStore: Storeable {

    enum MockCodableStoreError: Error {
        case unexpectedMethodCall, noValueSaved
    }

    var valueToReturn: Any?
    var valueSaved: Any?

    func fetchAll<Model: Decodable>() throws -> [Model] {
        throw MockCodableStoreError.unexpectedMethodCall
    }

    func fetch<Model: Decodable>(for key: String) throws -> Model {
        guard let value = valueToReturn as? Model else {
            throw MockCodableStoreError.noValueSaved
        }
        return value
    }

    func save<Model: Encodable>(_ value: Model, for key: String) throws {
        self.valueSaved = value
    }

    func delete(key: String) { }
}
