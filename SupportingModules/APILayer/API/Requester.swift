//
//  Requester.swift
//  RX
//
//  Created by Ross Patman on 22/10/2017.
//  Copyright © 2017 RossPatman. All rights reserved.
//
import Foundation
import RxSwift
public enum RequesterDateFormat {
    case timestampMilliseconds
    case timestampSeconds
    case formatted(format: String, localeIdentifier: String)
}

public protocol Requester {
    static func root() -> RequestRootURL
    static var endpoint: String? { get }
    static func preDispatchAction() -> Observable<Any?>?
    static func interceptors() -> [(URLRequest) -> (URLRequest)]?
    static func dateFormat() -> RequesterDateFormat?
}

public extension Requester {
    static func request(forId id: String? = nil) -> URLRequest {
        var theEndpoint = endpoint ?? ""
        if let id = id { theEndpoint += "/\(id)" }
        return RequestCreator.createRequest(withRoot: Self.root(), andEndpoint: theEndpoint, httpMethod: .GET, body: nil, headers: nil)
    }
    static func response(forRequest request: URLRequest) -> Observable<Any> {
        var interceptedAction: Observable<Any> {
            let request = Self.applyInterceptors(request: request)
            return RequestDispatcher.dispatch(request: request)
        }
        if let preDispatchAction = Self.preDispatchAction() {
            return preDispatchAction.flatMap { _ in
                return interceptedAction
            }
        }
        return interceptedAction
    }
    static func applyInterceptors(request: URLRequest) -> URLRequest {
        var request = request
        if let interceptors = Self.interceptors() {
            for interceptor in interceptors {
                request = interceptor(request)
            }
        }
        return request
    }
    static func encode<T: Codable>(dataForBody: T) -> Any {
        let encoder = DiskCacheCodableInterface.encoder(forDateFormat: dateFormat())
        guard let data = try? encoder.encode(dataForBody), let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return [:] }
        return json
    }
}
