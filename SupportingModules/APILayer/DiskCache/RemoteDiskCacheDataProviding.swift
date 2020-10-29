//
//  RemoteDiskCacheDataProviding.swift
//  RX
//
//  Created by Ross Patman on 21/10/2017.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Combine

// Retrieves and automatically manages caching of API responses
public protocol RemoteDiskCacheDataProviding {
    associatedtype Cdble: Codable
    associatedtype Rqstr: Requester
}

public extension RemoteDiskCacheDataProviding {

    static func items(
        forRequest request: URLRequest = Rqstr.request(forId: nil),
        strategy: DiskCacheDataProvidingStrategy = .localOrRemoteIfExpired
    ) -> AnyPublisher<[Cdble], Error> {
        return retrieve(type: [Cdble].self, forRequest: request, strategy: strategy)
    }

    static func item(
        forRequest request: URLRequest,
        strategy: DiskCacheDataProvidingStrategy = .localOrRemoteIfExpired
    ) -> AnyPublisher<Cdble, Error> {
        return retrieve(type: Cdble.self, forRequest: request, strategy: strategy)
    }

    static func retrieve<T: Codable>(
        type: T.Type,
        forRequest request: URLRequest = Rqstr.request(forId: nil),
        privateObj: Bool = false,
        strategy: DiskCacheDataProvidingStrategy = .localOrRemoteIfExpired
    ) -> AnyPublisher<T, Error> {
        var fileName = request.identifier
        if privateObj { fileName += DiskCache.privateIndicator }
        // NOTE: Seems redundant to have these two calls, can we have a ignoreSystemCache parameter?
        let theRemote = strategy == .remoteWithoutCachingResponse ?
            remote(
                ofType: type.self,
                forRequest: request,
                saveToFileWithName: nil)
        :
            remote(
                ofType: type.self,
                forRequest: request,
                saveToFileWithName: fileName,
                ignoreSystemCache: strategy == .localAndForcedRemote)
        switch strategy {
        case .localOrRemoteIfExpired:
            guard let theLocal = local(
                    ofType: type.self,
                    fileName: fileName).obj
            else {
                return theRemote
            }
            return theLocal.setFailureType(to: Error.self).eraseToAnyPublisher()
        case .localAndRemoteIfExpired, .localAndRemote, .localAndForcedRemote:
            let cacheResponse = local(ofType: type.self, fileName: fileName, includeExpired: true)
            guard let theLocal = cacheResponse.obj else { return theRemote }
            if strategy == .localAndRemote || strategy == .localAndForcedRemote || cacheResponse.expired {
                return theLocal.setFailureType(to: Error.self).append(theRemote).eraseToAnyPublisher()
            } else {
                return theLocal.setFailureType(to: Error.self).eraseToAnyPublisher()
            }
        case .remote, .remoteWithoutCachingResponse:
            return theRemote
        }
    }

    private static func local<T: Codable>(ofType type: T.Type, fileName: String, includeExpired: Bool = false) -> (obj: AnyPublisher<T, Never>?, expired: Bool) {
        let localResponse = DiskCacheCodableInterface.local(ofType: type, fileName: fileName, includeExpired: includeExpired, dateFormat: Rqstr.dateFormat())
        guard let localObj = localResponse.obj else { return (obj: nil, expired: false) }
        return (obj: Just(localObj).eraseToAnyPublisher(), expired: localResponse.expired)
    }

    private static func remote<T: Codable>(ofType type: T.Type, forRequest request: URLRequest, saveToFileWithName fileName: String?, ignoreSystemCache: Bool = false) -> AnyPublisher<T, Error> {
        var request = request
        if ignoreSystemCache { request.cachePolicy = .reloadIgnoringLocalCacheData }
        return Rqstr.response(forRequest: request).flatMap { justT -> AnyPublisher<T, Error> in
            guard let justT = justT as? Just<Any> else {
                return Fail<T, Error>(error: DiskCacheDataProvidingError.unparseable).eraseToAnyPublisher()
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: justT.output, options: [])
                if let fileName = fileName, let string = String(data: jsonData, encoding: .utf8) {
                    DiskCache.save(file: string, withFileName: fileName)
                }
                let result = try DiskCacheCodableInterface.decode(data: jsonData, toType: T.self, dateFormat: Rqstr.dateFormat())
                return Just(result)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            } catch {
                return Fail<T, Error>(error: DiskCacheDataProvidingError.unparseable).eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
}
