//
//  V3APITokenManager.swift
//  APIUtilities
//
//  Created by Olivier Butler on 05/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Combine

public class V3APITokenManager: V3APITokenManagable {

    public var token: String? { authorisationStore.accessToken }
    public var tokenIsValid: Bool { authorisationStore.accessTokenValid }
    public var getTokenObservable: AnyPublisher<Void, Never>? {
        oAuthRefreshOrWaitActionGenerator.refreshTokenOrWaitAction
    }

    private var cancellable: Set<AnyCancellable> = .init()
    private let authorisationStore: AuthorisationStoring
    private let oAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating

    init(authorisationStore: AuthorisationStoring, oAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating) {
        self.authorisationStore = authorisationStore
        self.oAuthRefreshOrWaitActionGenerator = oAuthRefreshOrWaitActionGenerator
    }

    public func getValidToken(_ completion: (() -> Void)?) {
        guard let getTokenObservable = oAuthRefreshOrWaitActionGenerator.refreshTokenOrWaitAction else {
            completion?()
            return
        }
        getTokenObservable
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .prefix(1)
            .sink(receiveValue: { _ in
                completion?()
            })
            .store(in: &cancellable)
    }
}
