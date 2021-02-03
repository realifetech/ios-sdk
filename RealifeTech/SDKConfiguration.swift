//
//  SDKConfiguration.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 25/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RealifeTech_CoreSDK

public struct SDKConfiguration {

    public let appCode: String
    public let clientSecret: String
    public let apiUrl: String?
    public let graphQLApiUrlString: String?

    /// - Parameter appCode: String used to identify the application which uses the RealifeTech SDK
    /// - Parameter clientSecret: String which is used to authenticate with the RealifeTech backend
    /// - Parameter apiUrl: [Optional] Provide a string value of a URL to override the SDK default
    /// - Parameter graphApiUrl: [Optional] Provide a string value of a URL to override the SDK default
    public init(appCode: String, clientSecret: String, apiUrl: String? = nil, graphQLApiUrlString: String? = nil) {
        self.appCode = appCode
        self.clientSecret = clientSecret
        self.apiUrl = apiUrl
        self.graphQLApiUrlString = graphQLApiUrlString
    }
}
