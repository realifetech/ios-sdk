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

protocol OAuthRefreshOrWaitActionGenerating {
    var refreshTokenOrWaitAction: Observable<Void>? { get }
}

struct OAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating {

    private let authorisationWorker: AuthorisationWorkable
    private let authorisationStore: AuthorisationStoring
    private let oAuthTokenRefreshWatcher: OAuthTokenRefreshWatchable

    init (authorisationWorker: AuthorisationWorkable, oAuthTokenRefreshWatcher: OAuthTokenRefreshWatchable, authorisationStore: AuthorisationStoring) {
        self.authorisationWorker = authorisationWorker
        self.authorisationStore = authorisationStore
        self.oAuthTokenRefreshWatcher = oAuthTokenRefreshWatcher
    }

    /// Nil if we have a valid token. If no token exists, or it is invalid, or being currently refreshed, this will return an observable which will emit once the token action is complete.
    var refreshTokenOrWaitAction: Observable<Void>? {
        if let ongoingTokenRefresh = oAuthTokenRefreshWatcher.ongoingTokenRefresh {
            // We take 1 because we only care about the current refresh.
            return ongoingTokenRefresh.take(1).map { _ in return () }
        } else if authorisationStore.accessTokenValid {
            return nil
        }
        return authorisationWorker.requestInitialAccessToken
            .do(onNext: { _ in
                self.oAuthTokenRefreshWatcher.updateRefreshingStatus(newValue: .valid)
            }, onError: { _ in
                self.oAuthTokenRefreshWatcher.updateRefreshingStatus(newValue: .invalid)
            }, onSubscribe: {
                self.oAuthTokenRefreshWatcher.updateRefreshingStatus(newValue: .refreshing)
            })
            .map { _ in
                return ()
            }
    }
}
