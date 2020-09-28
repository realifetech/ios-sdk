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
    static var refreshTokenOrWaitAction: Observable<Any?>? {
        //we take 1 so that observables don't keep listening for refreshes after a refresh has been successful
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
