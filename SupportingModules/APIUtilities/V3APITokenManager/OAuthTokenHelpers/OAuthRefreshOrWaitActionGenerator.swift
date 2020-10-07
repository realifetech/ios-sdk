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

/// Ensures we only make a new request when one is required
struct OAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating {

    private let authorisationWorker: AuthorisationWorkable
    private let authorisationStore: AuthorisationStoring
    private let oAuthTokenRefreshWatcher: OAuthTokenRefreshWatchable

    init (authorisationWorker: AuthorisationWorkable, oAuthTokenRefreshWatcher: OAuthTokenRefreshWatchable, authorisationStore: AuthorisationStoring) {
        self.authorisationWorker = authorisationWorker
        self.authorisationStore = authorisationStore
        self.oAuthTokenRefreshWatcher = oAuthTokenRefreshWatcher
    }

    /// Nil if we have a valid token. If no token exists, or is invalid, or is being currently refreshed, this will return an observable which will emit once the token action is complete.
    var refreshTokenOrWaitAction: Observable<Void>? {
        if let ongoingTokenRefresh = oAuthTokenRefreshWatcher.ongoingTokenRefresh {
            // We take 1 because we only care about the current refresh.
            print("🥬 RefreshOrAwayGen: Token is already refreshing.")
            return ongoingTokenRefresh.take(1).map { _ in return () }
        } else if authorisationStore.accessTokenValid {
            print("🥬 RefreshOrAwayGen: Token is valid...")
            return nil
        }
        print("🥬 RefreshOrAwayGen: Token needs refreshing!")
        self.oAuthTokenRefreshWatcher.updateRefreshingStatus(newValue: .refreshing)
        return authorisationWorker.requestInitialAccessToken
            .do(onNext: { _ in
                self.oAuthTokenRefreshWatcher.updateRefreshingStatus(newValue: .valid)
            }, onError: { _ in
                self.oAuthTokenRefreshWatcher.updateRefreshingStatus(newValue: .invalid)
            })
            .map { _ in
                print("🖨️ RefreshOrAwayGen: Mapping values to void")
                return ()
            }
            .catchError { _ in
                print("🖨️ RefreshOrAwayGen: Catching error and mapping to void")
                return Observable.just(())
            }
    }
}
