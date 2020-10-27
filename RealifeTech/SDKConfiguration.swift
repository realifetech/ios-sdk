//
//  SDKConfiguration.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 25/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public struct SDKConfiguration {
    public var appCode: String
    public var clientSecret: String
    public var apiUrl: String
    public var graphApiUrlString: String

    static var defaultApiUrl: String =  "http://api-staging.livestyled.com/v3"
    static var defaultGraphApiUrl: String = "https://graphql-staging.realifetech.com/graphql"

    /// - Parameter appCode: String used to identify the application which uses the RealifeTech SDK
    /// - Parameter clientSecret: String which is used to authenticate with the RealifeTech backend
    /// - Parameter apiUrl: [Optional] Provide a string value of a URL to override the SDK default
    /// - Parameter graphApiUrl: [Optional] Provide a string value of a URL to override the SDK default
    public init(appCode: String, clientSecret: String, apiUrl: String? = nil, graphApiUrl: String? = nil) {
        self.appCode = appCode
        self.clientSecret = clientSecret
        self.apiUrl = apiUrl ?? SDKConfiguration.defaultApiUrl
        self.graphApiUrlString = graphApiUrl ?? SDKConfiguration.defaultGraphApiUrl
    }
}

extension SDKConfiguration {

    var graphApiUrl: URL { URL(string: graphApiUrlString) ?? URL(fileURLWithPath: "") }
}
