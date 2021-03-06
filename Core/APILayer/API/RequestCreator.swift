//
//  RequestCreator.swift
//  RX
//
//  Created by Ross Patman on 18/09/2017.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public enum HttpMethod: String, CaseIterable {
    case GET, PUT, POST, DELETE, PATCH
}

public struct RequestCreator {

    static func path(withRoot root: String, andEndpoint endpoint: String) -> String {
        return root + endpoint
    }

    /// Generate an URLRequest with timeout interval 30 seconds
    /// - Parameters:
    ///   - root: Base URL
    ///   - endpoint: The endpoint of the API call
    ///   - httpMethod: GET, PUT, POST, DELETE, PATCH
    ///   - body: If the HTTPMethod is GET, the function adds [URLQueryItem] to the URL.
    ///           Otherwise, the function sets the httpBody with converted data.
    ///           The default is nil.
    ///   - bodyData: This should be passed only when the HTTPMethod is NOT GET. The default is nil.
    ///   - headers: The function sets allHTTPHeaderFields with the headers. The default if nil.
    /// - Returns: An URLRequest
    public static func createRequest(
        withRoot root: String,
        andEndpoint endpoint: String,
        httpMethod: HttpMethod,
        body: [String: Any]? = nil,
        bodyData: Data? = nil,
        headers: [String: String]? = nil
    ) -> URLRequest {
        let urlString = path(withRoot: root, andEndpoint: endpoint)
        var request = URLRequest(url: URL(string: urlString)!, timeoutInterval: 30)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers

        if let body = body {
            request.url = makeQueryItems(for: request, with: body)
            request.httpBody = makeBodyData(for: httpMethod, with: body)
        }

        if let bodyData = bodyData {
            request.httpBody = bodyData
        }

        return request
    }

    private static func makeQueryItems(for request: URLRequest, with body: [String: Any]) -> URL? {
        guard
            request.httpMethod == HttpMethod.GET.rawValue,
            let url = request.url,
            var urlComponents = URLComponents(string: url.absoluteString)
        else {
            return request.url
        }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        body
            .sorted(by: { $0.key < $1.key })
            .forEach { (key, value) in
                if let arrayValue = value as? [String] {
                    arrayValue.forEach {
                        queryItems.append(URLQueryItem(name: key, value: $0))
                    }
                } else {
                    queryItems.append((URLQueryItem(name: key, value: String(describing: value))))
                }
            }
        urlComponents.queryItems = queryItems
        urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?
            .replacingOccurrences(of: "+", with: "%2B")
        return urlComponents.url
    }

    private static func makeBodyData(for httpMethod: HttpMethod, with body: [String: Any]) -> Data? {
        switch httpMethod {
        case .GET:
            return nil
        default:
            return try? JSONSerialization.data(
                withJSONObject: body,
                options: [.prettyPrinted, .sortedKeys])
        }
    }
}
