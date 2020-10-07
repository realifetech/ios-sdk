//
//  V3APITokenManager.swift
//  APIUtilities
//
//  Created by Olivier Butler on 05/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

public class V3APITokenManager: V3APITokenManagable {

    public var token: String? { authorisationStore.accessToken }
    public var tokenIsValid: Bool { authorisationStore.accessTokenValid }
    public var getTokenObservable: Observable<Void>? {
        oAuthRefreshOrWaitActionGenerator.refreshTokenOrWaitAction
    }

    private let authorisationStore: AuthorisationStoring
    private let oAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating
    private let disposeBag: DisposeBag = DisposeBag()

    init(authorisationStore: AuthorisationStore, oAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating) {
        self.authorisationStore = authorisationStore
        self.oAuthRefreshOrWaitActionGenerator = oAuthRefreshOrWaitActionGenerator
    }

    public func getValidToken(_ completion: (() -> Void)?) {
        print("🌟 V3 Token Manager: We were asked to get a valid token")
        guard let getTokenObservable = getTokenObservable else {
            completion?()
            return
        }
        print("🌟 V3 Token Manager: We got a token observable!")
        getTokenObservable
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .take(1)
            .subscribe { _ in
                // This is executed twice...
                print("🌟 V3 Token Manager: Our 'getValidToken' method returned")
                completion?()
            }
            .disposed(by: disposeBag)
    }
}
