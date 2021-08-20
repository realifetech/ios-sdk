//
//  SDKConfiguration.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 25/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public struct SDKConfiguration {

    public let appCode: String
    public let clientSecret: String
    public let apiUrl: String
    public let graphQLApiUrlString: String
    public let webOrderingJourneyUrl: String

    static let defaultApiUrl =  "https://api.livestyled.com/v3"
    static let defaultGraphQLApiUrl = "https://graphql-eu.realifetech.com"
    static let defaultWebOrderingJourneyUrl = "https://ordering.realifetech.com/"

    /// - Parameters:
    ///   - appCode: String used to identify the application which uses the RealifeTech SDK
    ///   - clientSecret: String which is used to authenticate with the RealifeTech backend
    ///   - apiUrl: [Optional] Provide a string value of a URL to override the SDK default
    ///   - graphQLApiUrlString: [Optional] Provide a string value of a URL to override the SDK default
    ///   - webOrderingJourneyUrl: [Optional] Provide a string value of a URL to override the SDK default
    public init(
        appCode: String,
        clientSecret: String,
        apiUrl: String? = nil,
        graphQLApiUrlString: String? = nil,
        webOrderingJourneyUrl: String? = nil
    ) {
        self.appCode = appCode
        self.clientSecret = clientSecret
        self.apiUrl = apiUrl ?? Self.defaultApiUrl
        self.graphQLApiUrlString = graphQLApiUrlString ?? Self.defaultGraphQLApiUrl
        self.webOrderingJourneyUrl = webOrderingJourneyUrl ?? Self.defaultWebOrderingJourneyUrl
    }
}

extension SDKConfiguration {

    var graphQLApiUrl: URL { URL(string: graphQLApiUrlString) ?? URL(fileURLWithPath: "") }
}
