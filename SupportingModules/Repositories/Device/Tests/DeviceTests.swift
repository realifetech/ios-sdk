//
//  RepositoriesTests.swift
//  DeviceTests
//
//  Created by Olivier Butler on 09/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import Repositories

class DeviceTests: XCTestCase {

    static let jsonDevice: String = "{\"appVersion\":\"0.0.1alpha\",\"manufacturer\":\"APPL\",\"osVersion\":\"4\",\"model\":\"OlivierPhone\",\"wifiConnected\":true,\"bluetoothOn\":false,\"type\":\"IOS\",\"token\":\"123\"}"

    static let testDevice: Device = Device(
        deviceId: "123",
        model: "OlivierPhone",
        sdkVersion: "0.0.1alpha",
        osVersion: "4",
        bluetoothOn: false,
        wifiConnected: true)

    func test_jsonRepresentation() {
        let sutDict = DeviceTests.testDevice.jsonRepresentation
        guard
            let data = DeviceTests.jsonDevice.data(using: .utf8),
            let testDict = try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments) as? [String: Any]
            else {
                return XCTFail("test setup failed")
        }
        sutDict.enumerated().forEach { (offset, elementTuple) in
            let (key, value) = elementTuple
            if let isBool = value as? Bool {
                XCTAssertEqual(isBool, testDict[key] as? Bool)
            } else if let isString = value as? String {
                XCTAssertEqual(isString, testDict[key] as? String)
            } else {
                XCTFail("Unexpected device value")
            }
        }
    }

}
