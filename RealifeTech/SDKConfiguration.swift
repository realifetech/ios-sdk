//
//  SDKConfiguration.swift
//  RealifeTech-SDK
//
//  Created by Olivier Butler on 25/09/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation
import General

public struct SDKConfiguration: General.SDKConfiguration {
    public var appCode: String
    public var clientSecret: String
    public var apiUrl: String?
    public var graphApiUrl: String?

    /// - Parameter appCode: String used to identify the application which uses the RealifeTech SDK
    /// - Parameter clientSecret: String which is used to authenticate with the RealifeTech backend
    /// - Parameter apiUrl: [Optional] Provide a string value of a URL to override the SDK default
    /// - Parameter graphApiUrl: [Optional] Provide a string value of a URL to override the SDK default
    public init(appCode: String, clientSecret: String, apiUrl: String? = nil, graphApiUrl: String? = nil) {
        self.appCode = appCode
        self.clientSecret = clientSecret
        self.apiUrl = apiUrl
        self.graphApiUrl = graphApiUrl
    }
}
