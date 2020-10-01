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
        // We take 1 because we only care about the ongoing refresh, not subsequent ones.
        if let refreshSuccessfulIfRefreshing = OAuthTokenRefreshWatcher.shared.refreshSuccessfulIfRefreshing { return refreshSuccessfulIfRefreshing.take(1).map { $0 as Any? } }
        let isLoggedIn = UserProfileDataManager.sharedInstance.isUserLoggedIn()
        guard let refresh = isLoggedIn ? UserAuthenticator.refreshAccessToken : UserAuthenticator.requestInitialAccessToken else { return nil }
        OAuthTokenRefreshWatcher.shared.updateRefreshingStatus(newValue: .refreshing)
        return refresh.do(onError: { (error) in
            OAuthTokenRefreshWatcher.shared.updateRefreshingStatus(newValue: .invalid)
            guard isLoggedIn, let error = error as? APIError, error.clientError else { return }
            // TODO: Insert refrence to clearing the user's data
        })
            .map {
                OAuthTokenRefreshWatcher.shared.updateRefreshingStatus(newValue: .valid)
                return $0
        }
    }
}
