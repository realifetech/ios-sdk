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

struct OAuthSender: RemoteDiskCacheDataProviding {
    typealias Cdble = OAuthToken
    typealias Rqstr = OAuthRequester
}

extension OAuthSender {
    static func requestInitialAccessToken() -> Observable<OAuthToken> {
        return retrieve(type: Cdble.self, forRequest: Rqstr.requestInitialAccessToken(), strategy: .remoteWithoutCachingResponse)
    }
    static func requestAccessToken(withUsername username: String, andPassword password: String) -> Observable<OAuthToken> {
        return retrieve(type: Cdble.self, forRequest: Rqstr.requestAccessToken(withUsername: username, andPassword: password), strategy: .remoteWithoutCachingResponse)
    }
    static func requestAccessToken(withCode code: String) -> Observable<OAuthToken> {
        return retrieve(type: Cdble.self, forRequest: Rqstr.requestAccessToken(withCode: code), strategy: .remoteWithoutCachingResponse)
    }
    static func refreshAccessToken(refreshToken: String) -> Observable<OAuthToken> {
        return retrieve(type: Cdble.self, forRequest: Rqstr.refreshAccessToken(withRefreshToken: refreshToken), strategy: .remoteWithoutCachingResponse)
    }
}
