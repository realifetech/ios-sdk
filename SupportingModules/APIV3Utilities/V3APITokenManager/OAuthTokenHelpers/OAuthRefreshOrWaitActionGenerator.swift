//
//  OAuthRefreshOrWaitActionGenerator.swift
//  CLArena
//
//  Created by Ross Patman on 29/05/2019.
//  Copyright © 2019 ConcertLive. All rights reserved.
//

import Foundation
import Combine

protocol OAuthRefreshOrWaitActionGenerating {
    var refreshTokenOrWaitAction: AnyPublisher<Void, Never>? { get }
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
    var refreshTokenOrWaitAction: AnyPublisher<Void, Never>? {
        if let ongoingTokenRefresh = oAuthTokenRefreshWatcher.ongoingTokenRefresh {
            // We take 1 because we only care about the current refresh.
            return ongoingTokenRefresh
                .prefix(1)
                .map { _ in return () }
                .eraseToAnyPublisher()
        } else if authorisationStore.accessTokenValid {
            return nil
        }
        self.oAuthTokenRefreshWatcher.updateRefreshingStatus(newValue: .refreshing)
        return authorisationWorker.requestInitialAccessToken
            .prefix(1)
            .handleEvents(receiveOutput: { _ in
                self.oAuthTokenRefreshWatcher.updateRefreshingStatus(newValue: .valid)
            }, receiveCompletion: { result in
                switch result {
                case .finished: break
                case .failure:
                    self.oAuthTokenRefreshWatcher.updateRefreshingStatus(newValue: .invalid)
                }
            })
            .map { _ in return () }
            .catch { _ in return Just(()) }
            .eraseToAnyPublisher()
    }
}
