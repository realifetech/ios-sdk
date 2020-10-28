//
//  DefaultV3DiskCacheStrategyProviding.swift
//  CLArena
//
//  Created by Ross Patman on 21/11/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import Combine

protocol DefaultV3DiskCacheStrategyProviding { }

private extension Bool {
    var diskCacheDataProvidingStrategy: DiskCacheDataProvidingStrategy {
        return self ? .localAndForcedRemote : .localAndRemote
    }
}

extension DefaultV3DiskCacheStrategyProviding where Self: RemoteDiskCacheDataProviding {
    static func retrieve<T: Codable>(type: T.Type, forRequest request: URLRequest = Rqstr.request(forId: nil), privateObj: Bool = false, forceUpdate: Bool = false) -> AnyPublisher<T, Error> {
        return retrieve(type: type, forRequest: request, privateObj: privateObj, strategy: forceUpdate.diskCacheDataProvidingStrategy)
    }
}
