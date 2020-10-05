//
//  DeviceIdHeaderRequestInserting
//  CLArena
//
//  Created by Ross Patman on 04/05/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import APILayer

protocol DeviceIdHeaderRequestInserting {
    static func addDeviceIdHeader(toRequest request: URLRequest) -> URLRequest
}

extension DeviceIdHeaderRequestInserting {
    static func addDeviceIdHeader(toRequest request: URLRequest) -> URLRequest {
        var request = request
        let deviceIdHeader = RequestHeader.generateDeviceIdHeader(deviceId: ApiHeaderVariables.sharedInstance.deviceID)
        request.addValue(deviceIdHeader.valueForHeader, forHTTPHeaderField: deviceIdHeader.header)
        return request
    }
}