//
//  OAuthSender.swift
//  CLArena
//
//  Created by apple on 13/04/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import APILayer
import RxSwift

struct OAuthRepository: RemoteDiskCacheDataProviding {
    typealias Cdble = OAuthToken
    typealias Rqstr = OAuthRequester
}

extension OAuthRepository {
    static func requestInitialAccessToken() -> Observable<OAuthToken> {
        return retrieve(type: Cdble.self, forRequest: Rqstr.requestInitialAccessToken(), strategy: .remoteWithoutCachingResponse)
    }
}
