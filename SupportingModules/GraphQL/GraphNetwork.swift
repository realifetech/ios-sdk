//
//  GraphNetwork.swift
//  CLArena
//
//  Created by Jonathon Albert on 19/08/2020.
//  Copyright © 2020 ConcertLive. All rights reserved.
//

import Foundation
import Apollo

public class GraphNetwork {

    let graphQLAPIUrl: URL
    let tokenHelper: V3APITokenManagable
    let deviceId: String
    let reachabilityHelper: ReachabilityChecking

    public init(
        graphQLAPIUrl: URL,
        tokenHelper: V3APITokenManagable,
        deviceId: String,
        reachabilityHelper: ReachabilityChecking
    ) {
        self.graphQLAPIUrl = graphQLAPIUrl
        self.tokenHelper = tokenHelper
        self.deviceId = deviceId
        self.reachabilityHelper = reachabilityHelper
    }

    private lazy var networkTransport: HTTPNetworkTransport = {
        let transport = HTTPNetworkTransport(url: graphQLAPIUrl)
        transport.delegate = self
        return transport
    }()

    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
}

// MARK: - Pre-flight delegate

extension GraphNetwork: HTTPNetworkTransportPreflightDelegate {

    public func networkTransport(
        _ networkTransport: HTTPNetworkTransport,
        shouldSend request: URLRequest
    ) -> Bool {
        guard reachabilityHelper.isConnectedToWifi else {
            // Save Request
            return false
        }
        return true
    }

    public func networkTransport(
        _ networkTransport: HTTPNetworkTransport,
        willSend request: inout URLRequest
    ) {
        var headers = request.allHTTPHeaderFields ?? [String: String]()
        headers["X-Ls-DeviceId"] = deviceId
        if tokenHelper.tokenIsValid, let token = tokenHelper.token {
            headers["Authorization"] = "Bearer \(token)"
        }
        request.allHTTPHeaderFields = headers
    }
}

// MARK: - Task Completed Delegate

extension GraphNetwork: HTTPNetworkTransportTaskCompletedDelegate {

    public func networkTransport(
        _ networkTransport: HTTPNetworkTransport,
        didCompleteRawTaskForRequest request: URLRequest,
        withData data: Data?,
        response: URLResponse?,
        error: Error?
    ) {
        #if APILOGGING
        if let error = error {
            print("Error: \(error)")
        }
        if let response = response {
            print("Response: \(response)")
        } else {
            print("No URL Response received!")
        }
        if let data = data {
            print("Data: \(String(describing: String(bytes: data, encoding: .utf8)))")
        } else {
            print("No data received!")
        }
        #endif
    }
}

// MARK: - Retry Delegate

extension GraphNetwork: HTTPNetworkTransportRetryDelegate {

    public func networkTransport(
        _ networkTransport: HTTPNetworkTransport,
        receivedError error: Error,
        for request: URLRequest,
        response: URLResponse?,
        continueHandler: @escaping (_ action: HTTPNetworkTransport.ContinueAction) -> Void
    ) {
        #if APILOGGING
        print("\(error.localizedDescription)")
        #endif
        if let urlResponse = response as? HTTPURLResponse, 400 == urlResponse.statusCode {
            tokenHelper.getValidToken {
                continueHandler(.retry)
            }
        }
    }
}
