//
//  RequestDispatcher.swift
//  RX
//
//  Created by Ross Patman on 22/10/2017.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

struct RequestDispatcher {

    let request: URLRequest
    let timeLogger: RequestTimeLogger
    let sessionObservable: Observable<(response: HTTPURLResponse, data: Data)>

    init(
        request: URLRequest,
        timeLogger: RequestTimeLogger = .shared,
        sessionObservable: Observable<(response: HTTPURLResponse, data: Data)>
    ) {
        self.request = request
        self.timeLogger = timeLogger
        self.sessionObservable = sessionObservable
    }

    func dispatch() -> Observable<Data> {
        return sessionObservable
            .flatMap({ (response: HTTPURLResponse, data: Data) -> Observable<Data> in
                if 200 ..< 300 ~= response.statusCode {
                    return .just(data)
                } else {
                    return .error(APIError.constructedError(data: data, statusCode: response.statusCode))
                }
            })
            .do(onNext: { _ in
                timeLogger.removeRequest(withIdentifier: request.identifier)
            }, onError: { _ in
                timeLogger.removeRequest(withIdentifier: request.identifier)
            }, onSubscribe: {
                timeLogger.addRequest(withIdentifier: request.identifier)
            })
    }
}
