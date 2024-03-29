//
//  Requester.swift
//  RX
//
//  Created by Ross Patman on 22/10/2017.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public typealias RequesterDateFormat = (format: String, localeIdentifier: String)

public protocol Requester {
    static func root() -> String
    static var endpoint: String { get }
    static func preDispatchAction() -> Observable<Any?>?
    static func interceptors() -> [(URLRequest) -> (URLRequest)]?
    static func dateFormat() -> RequesterDateFormat?
    static func response(forRequest request: URLRequest) -> Observable<Data>
}

public extension Requester {

    static func request(forId id: String? = nil) -> URLRequest {
        var theEndpoint = endpoint
        if let id = id {
            theEndpoint += "/\(id)"
        }
        return RequestCreator.createRequest(
            withRoot: Self.root(),
            andEndpoint: theEndpoint,
            httpMethod: .GET)
    }

    static func response(forRequest request: URLRequest) -> Observable<Data> {
        var interceptedAction: Observable<Data> {
            let request = Self.applyInterceptors(request: request)
            let dispatcher = RequestDispatcher(
                request: request,
                sessionObservable: RequesterURLSessionProvider().session.rx.response(request: request))
            return dispatcher.dispatch()
        }
        // If we have a pre-dispatch action (e.g. in OAuthRefreshOrWaitActionGenerator),
        // we wrap the original request in that action. If not, we just return the original action.
        if let preDispatchAction = Self.preDispatchAction() {
            // This means that we'll wait for the pre-dispatch action to complete,
            // then perform the original request (in this case called interceptedAction).
            return preDispatchAction.flatMap { _ in
                return interceptedAction
            }
        } else {
            return interceptedAction
        }
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
}
