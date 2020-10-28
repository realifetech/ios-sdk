//
//  RequestDispatcher.swift
//  RX
//
//  Created by Ross Patman on 22/10/2017.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Combine

public struct RequestDispatcher {
    static func dispatch(request: URLRequest) -> AnyPublisher<Any, Error> {
        RequestLogger.log(request: request)
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, response) in
                if let response = response as? HTTPURLResponse {
                    RequestLogger.log(response: response, withData: data)
                    if 200 ..< 300 ~= response.statusCode {
                        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                        return Just(jsonObject)
                    } else {
                        return Fail<Any, Error>(error: APIError.constructedError(data: data, statusCode: response.statusCode))
                    }
                } else {
                    return Fail<Any, Error>(error: APIError.unparseableError())
                }
            }
            .handleEvents(receiveSubscription: { _ in
                RequestTimeLogger.shared.addRequest(withIdentifier: request.identifier)
            }, receiveOutput: { _ in
                RequestTimeLogger.shared.removeRequest(withIdentifier: request.identifier)
            })
            .eraseToAnyPublisher()
    }
}
