//
//  RequestDispatcher.swift
//  RX
//
//  Created by Ross Patman on 22/10/2017.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ReqeustDispatching {
    var timeLogger: RequestTimeLogger { get }

    func getSessionObservable(from request: URLRequest) -> Observable<(response: HTTPURLResponse, data: Data)>
    func dispatch(request: URLRequest) -> Observable<Data>
}

struct RequestDispatcher: ReqeustDispatching {

    let timeLogger: RequestTimeLogger

    init(timeLogger: RequestTimeLogger = .shared) {
        self.timeLogger = timeLogger
    }

    func getSessionObservable(from request: URLRequest) -> Observable<(response: HTTPURLResponse, data: Data)> {
        URLSession.shared.rx.response(request: request)
    }

    func dispatch(request: URLRequest) -> Observable<Data> {
        return getSessionObservable(from: request)
            .flatMap({ (tuple: (response: URLResponse, data: Data)) -> Observable<Data> in
                let (response, data) = tuple
                if let response = response as? HTTPURLResponse {
                    if 200 ..< 300 ~= response.statusCode {
                        return .just(data)
                    } else {
                        return .error(APIError.constructedError(data: data, statusCode: response.statusCode))
                    }
                } else {
                    return .error(APIError.unparseableError())
                }
            })
            .do(onNext: { _ in
                self.timeLogger.removeRequest(withIdentifier: request.identifier)
            }, onError: { _ in
                self.timeLogger.removeRequest(withIdentifier: request.identifier)
            }, onSubscribe: {
                self.timeLogger.addRequest(withIdentifier: request.identifier)
            })
    }
}
