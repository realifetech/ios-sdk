//
//  DeviceRepositoryTests.swift
//  RealifeTechTests
//
//  Created by YOU-HSUAN YU on 2023/2/27.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
import RxSwift
@testable import RealifeTech

final class DeviceRepositoryTests: XCTestCase {

    private let bag = DisposeBag()

    func test_registerDevice_completeWithSuccess() {
        let device = createMockDevice()
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.SyncDeviceMutation.Data.self)
        graphQLManager.resultReturns = .success(makeSyncDeviceGraphQLResult(acknowledged: true))
        sut.registerDevice(device)
            .subscribe(onNext: { returnedResult in
            XCTAssertTrue(returnedResult)
        }).disposed(by: bag)
    }

    func test_registerDevice_completeWithFailure() {
        let device = createMockDevice()
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.SyncDeviceMutation.Data.self)
        graphQLManager.resultReturns = .failure(DummyError.failure)
        sut.registerDevice(device)
            .subscribe(onNext: { _ in
                XCTFail("Should return error")
            }, onError: { error in
                XCTAssertEqual(error as? DummyError, DummyError.failure)
            }).disposed(by: bag)
    }

    private func createMockDevice() -> Device {
        return Device(
            deviceId: "testToken",
            type: "IOS",
            model: "iphone",
            manufacturer: "APPLE",
            appVersion: "15.9",
            osVersion: "16.1",
            bluetoothOn: true,
            wifiConnected: true)
    }

    private func makeSyncDeviceGraphQLResult(acknowledged: Bool) -> GraphQLResult<ApolloType.SyncDeviceMutation.Data> {
        let syncDevice = ApolloType.SyncDeviceMutation.Data.SyncDevice(acknowledged: acknowledged)
        let data = ApolloType.SyncDeviceMutation.Data(syncDevice: syncDevice)
        return GraphQLResult<ApolloType.SyncDeviceMutation.Data>(
            data: data,
            extensions: [:],
            errors: nil,
            source: .cache,
            dependentKeys: nil)
    }

    private func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: DeviceRepository) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = DeviceRepository(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }
}
