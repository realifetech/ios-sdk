//
//  ApolloClient.swift
//  CLArena
//
//  Created by Jonathon Albert on 19/08/2020.
//  Copyright © 2020 ConcertLive. All rights reserved.
//

import Foundation
import Apollo
import UIDeviceHelper

class Network {
    static let shared = Network()

    // Configure the network transport to use the singleton as the delegate.
    private lazy var networkTransport: HTTPNetworkTransport = {
        let transport = HTTPNetworkTransport(url: URL(string: "https://graphql-mock.realifetech.com/graphql")!)
        transport.delegate = self
        return transport
    }()

    // Use the configured network transport in your Apollo client.
    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
}

// MARK: - Pre-flight delegate

extension Network: HTTPNetworkTransportPreflightDelegate {

    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          shouldSend request: URLRequest) -> Bool {
        // If there's an authenticated user, send the request. If not, don't.
        return true
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          willSend request: inout URLRequest) {
        // Get the existing headers, or create new ones if they're nil
        var headers = request.allHTTPHeaderFields ?? [String: String]()
        // Add any new headers you need
//        headers["Authorization"] = "Bearer \(UserManager.shared.currentAuthToken)"
        // Re-assign the updated headers to the request.
        let deviceHelper: UIDeviceInterface = UIDeviceFactory.makeUIDeviceHelper()
        headers["X-Ls-DeviceId"] = deviceHelper.deviceId
        request.allHTTPHeaderFields = headers
    }
}

// MARK: - Task Completed Delegate

extension Network: HTTPNetworkTransportTaskCompletedDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport,
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

extension Network: HTTPNetworkTransportRetryDelegate {

    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          receivedError error: Error,
                          for request: URLRequest,
                          response: URLResponse?,
                          continueHandler: @escaping (_ action: HTTPNetworkTransport.ContinueAction) -> Void) {
        // investigate error to handle appropriately
    }
}

public typealias FetchCompletion = (_ jsonObject: JSONObject?, _ error: Error?) -> Void
public typealias MutationCompletion = (_ jsonObject: JSONObject?, _ error: Error?) -> Void

public struct GraphQLDispatcher {
    public static func dispatch<T: GraphQLQuery>(query: T, completion: @escaping FetchCompletion) {
        Network.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                //print(graphQLResult.data)
                if let jsonObject = graphQLResult.data?.jsonObject {
                    return completion(jsonObject, nil)
                }
                return completion(nil, nil)
            case .failure(let error):
                print("Failure! Error: \(error)")
                return completion(nil, error)
            }
        }
    }

    public static func dispatchMutation<T: GraphQLMutation>(mutation: T, completion: @escaping MutationCompletion) {
        Network.shared.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                print(graphQLResult.data)
                if let jsonObject = graphQLResult.data?.jsonObject {
                    return completion(jsonObject, nil)
                }
                return completion(nil, nil)
            case .failure(let error):
                print("Failure! Error: \(error)")
                return completion(nil, error)
            }
        }
    }
}
