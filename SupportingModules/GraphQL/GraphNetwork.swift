//
//  GraphNetwork.swift
//  CLArena
//
//  Created by Jonathon Albert on 19/08/2020.
//  Copyright © 2020 ConcertLive. All rights reserved.
//

import Foundation
import Apollo
import UIDeviceHelper
import APIV3Utilities

public class GraphNetwork {

    let graphQLAPIUrl: URL
    let tokenHelper: V3APITokenManagable

    public init(graphQLAPIUrl: URL, tokenHelper: V3APITokenManagable) {
        self.graphQLAPIUrl = graphQLAPIUrl
        self.tokenHelper = tokenHelper
    }

    // Configure the network transport to use the singleton as the delegate.
    private lazy var networkTransport: HTTPNetworkTransport = {
        let transport = HTTPNetworkTransport(url: graphQLAPIUrl)
        transport.delegate = self
        return transport
    }()

    // Use the configured network transport in your Apollo client.
    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
}

// MARK: - Pre-flight delegate

extension GraphNetwork: HTTPNetworkTransportPreflightDelegate {

    public func networkTransport(_ networkTransport: HTTPNetworkTransport,
                                 shouldSend request: URLRequest) -> Bool {
        // If there's an authenticated user, send the request. If not, don't.
        return true
    }

    public func networkTransport(_ networkTransport: HTTPNetworkTransport,
                                 willSend request: inout URLRequest) {
        // Get the existing headers, or create new ones if they're nil
        var headers = request.allHTTPHeaderFields ?? [String: String]()
        let deviceHelper: UIDeviceInterface = UIDeviceFactory.makeUIDeviceHelper()
        headers["X-Ls-DeviceId"] = deviceHelper.deviceId
        if tokenHelper.tokenIsValid, let token = tokenHelper.token {
            headers["Authorization"] = "Bearer \(token)"
        }
        request.allHTTPHeaderFields = headers
    }
}

// MARK: - Task Completed Delegate

extension GraphNetwork: HTTPNetworkTransportTaskCompletedDelegate {

    public func networkTransport(_ networkTransport: HTTPNetworkTransport,
                                 didCompleteRawTaskForRequest request: URLRequest,
                                 withData data: Data?,
                                 response: URLResponse?,
                                 error: Error?) {
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
    }
}

// MARK: - Retry Delegate

extension GraphNetwork: HTTPNetworkTransportRetryDelegate {

    public func networkTransport(_ networkTransport: HTTPNetworkTransport,
                                 receivedError error: Error,
                                 for request: URLRequest,
                                 response: URLResponse?,
                                 continueHandler: @escaping (_ action: HTTPNetworkTransport.ContinueAction) -> Void) {
        // investigate error to handle appropriately
        print("\(error.localizedDescription)")
    }
}
