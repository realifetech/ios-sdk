//
//  APITokenManager.swift
//  APIUtilities
//
//  Created by Olivier Butler on 05/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

public class APITokenManager: APITokenManagable {

    public var token: String? { authorisationStore.accessToken }
    public var tokenIsValid: Bool { authorisationStore.accessTokenValid }
    public var refreshToken: String? { authorisationStore.refreshToken }
    public var refreshTokenIsValid: Bool { authorisationStore.refreshTokenValid }

    private let authorisationStore: AuthorisationStoring
    private let oAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating
    private let scheduler: SchedulerType
    private let disposeBag = DisposeBag()
    private let notificationCenter: NotificationCenter

    init(
        authorisationStore: AuthorisationStoring,
        oAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating,
        subscibeOnScheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background),
        notificationCenter: NotificationCenter
    ) {
        self.scheduler = subscibeOnScheduler
        self.authorisationStore = authorisationStore
        self.oAuthRefreshOrWaitActionGenerator = oAuthRefreshOrWaitActionGenerator
        self.notificationCenter = notificationCenter
    }

    public func getValidToken(_ completion: ((Result<Void, Error>) -> Void)?) {
        guard let getTokenObservable = oAuthRefreshOrWaitActionGenerator.refreshTokenOrWaitAction else {
            completion?(.success(()))
            return
        }
        getTokenObservable
            .subscribe(on: scheduler)
            .observe(on: MainScheduler.instance)
            .take(1)
            .subscribe(onNext: {
                completion?(.success(()))
            }, onError: { [weak self] error in
                if let apiError = error as? APIError, apiError.clientError {
                    self?.removeCredentials()
                }
                completion?(.failure(error))
            })
            .disposed(by: disposeBag)
    }

    public func storeCredentials(accessToken: String, secondsExpiresIn: Int, refreshToken: String?) {
        authorisationStore.saveCredentials(
            token: accessToken,
            secondsExpiresIn: secondsExpiresIn,
            refreshToken: refreshToken)
    }

    public func removeCredentials() {
        if authorisationStore.refreshToken != nil {
            notificationCenter.post(Notification(name: Notification.Name("rltSDKUserRequiresLogout")))
        }
        authorisationStore.removeCredentials()
    }
}
