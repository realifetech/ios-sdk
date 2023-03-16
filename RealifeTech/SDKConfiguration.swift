//
//  SDKConfiguration.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 25/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public struct SDKConfiguration: Codable {

    public let appCode: String
    public let appVersion: String
    public let clientSecret: String
    public let apiUrl: String
    public let graphQLApiUrl: String
    public let webOrderingJourneyUrl: String
    public let deviceId: String?
    let appGroupId: String

    static let defaultApiUrl =  "https://api.livestyled.com/v3"
    static let defaultGraphQLApiUrl = "https://graphql-eu.realifetech.com"
    static let defaultWebOrderingJourneyUrl = "https://ordering.realifetech.com/"

    /// - Parameters:
    ///   - appCode: String used to identify the application which uses the RealifeTech SDK
    ///   - appVersion: String which is used in register device mutation
    ///   - clientSecret: String which is used to authenticate with the RealifeTech backend
    ///   - deviceId: [Optional] Provide a string value as deviceId in the request header.
    ///     If deviceId is not provided, SDK uses identifierForVendor value from Apple as deviceId.
    ///   - apiUrl: [Optional] Provide a string value of a URL to override the SDK default
    ///   - graphQLApiUrl: [Optional] Provide a string value of a URL to override the SDK default
    ///   - webOrderingJourneyUrl: [Optional] Provide a string value of a URL to override the SDK default
    public init(
        appCode: String,
        appVersion: String,
        clientSecret: String,
        appGroupId: String,
        deviceId: String? = nil,
        apiUrl: String? = nil,
        graphQLApiUrl: String? = nil,
        webOrderingJourneyUrl: String? = nil
    ) {
        self.appGroupId = appGroupId
        self.appCode = appCode
        self.appVersion = appVersion
        self.clientSecret = clientSecret
        self.deviceId = deviceId
        self.apiUrl = apiUrl ?? Self.defaultApiUrl
        self.graphQLApiUrl = graphQLApiUrl ?? Self.defaultGraphQLApiUrl
        self.webOrderingJourneyUrl = webOrderingJourneyUrl ?? Self.defaultWebOrderingJourneyUrl
    }
}
