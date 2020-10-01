//
//  OAuthRefreshOrWaitActionGenerator.swift
//  CLArena
//
//  Created by Ross Patman on 29/05/2019.
//  Copyright © 2019 ConcertLive. All rights reserved.
//

import Foundation
import APILayer
import RxSwift

protocol OAuthRefreshOrWaitActionGenerator { }

extension OAuthRefreshOrWaitActionGenerator {
    /// Nil if we have a valid token. If no token exists, or it is invalid, or being currently refreshed, this will return an observable which will emit once the token action is complete.
    static var refreshTokenOrWaitAction: Observable<Any?>? {
        if let currentTokenRefresh = OAuthTokenRefreshWatcher.shared.ongoingTokenRefresh {
            // We take 1 because we only care about the ongoing refresh, not subsequent ones.
            return currentTokenRefresh.take(1).map { $0 as Any? }
        }
        guard let refresh = UserAuthenticator.requestInitialAccessToken else {
            // If we don't get an observable, it's because we don't need to refresh the current token
            return nil
        }
        OAuthTokenRefreshWatcher.shared.updateRefreshingStatus(newValue: .refreshing)
        return refresh
            .do(onError: { (error) in
                OAuthTokenRefreshWatcher.shared.updateRefreshingStatus(newValue: .invalid)
            })
            .map {
                OAuthTokenRefreshWatcher.shared.updateRefreshingStatus(newValue: .valid)
                return $0
            }
    }
}
