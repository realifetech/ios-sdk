//
//  AuthorisationWorker.swift
//  APIUtilities
//
//  Created by Olivier Butler on 02/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

/// Used to request our OAuth token. When new tokens are received, this worker will save them to its store.
protocol AuthorisationWorkable {
    var requestInitialAccessToken: Observable<OAuthToken> { get }
}

struct AuthorisationWorker: AuthorisationWorkable {
    private var authorisationStore: AuthorisationStoring

    init(authorisationStore: AuthorisationStoring) {
        self.authorisationStore = authorisationStore
    }

    var requestInitialAccessToken: Observable<OAuthToken> {
        return OAuthRepository.requestInitialAccessToken()
            .map { (token: OAuthToken) -> OAuthToken in
                if let accessToken = token.accessToken, let expiresIn = token.expiresIn {
                    self.authorisationStore.saveCredentials(
                        token: accessToken,
                        secondsExpiresIn: expiresIn)
                }
                print("👮 AuthorisationWorker: We got one token and saved it")
                return token
        }
    }
}
