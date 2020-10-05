//
//  ApiHeaderVariables.swift
//  APIUtilities
//
//  Created by Olivier Butler on 05/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

// This protocol is used to allow our statically typed V3 API layer to make use of a specific instance.
protocol SharedApiHeaderVaribleStorage {
    static var sharedInstance: ApiHeaderVariableHolding { get }
}

public class ApiHeaderVariables: ApiHeaderVariableHolding, SharedApiHeaderVaribleStorage {

    static var sharedInstance: ApiHeaderVariableHolding = EmptyHeaderVariables()

    public var deviceID: String
    public var token: String? { authorisationStore.accessToken }
    public var tokenIsValid: Bool { authorisationStore.accessTokenValid }
    public var getTokenObservable: Observable<Void>? {
        oAuthRefreshOrWaitActionGenerator.refreshTokenOrWaitAction
    }

    private let authorisationStore: AuthorisationStoring
    private let oAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating
    private let disposeBag: DisposeBag = DisposeBag()

    init(deviceID: String, authorisationStore: AuthorisationStore, oAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating) {
        self.authorisationStore = authorisationStore
        self.oAuthRefreshOrWaitActionGenerator = oAuthRefreshOrWaitActionGenerator
        self.deviceID = deviceID
    }

    public func getValidToken(_ completion: (() -> Void)?) {
        guard let getTokenObservable = getTokenObservable else {
            completion?()
            return
        }
        getTokenObservable
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe { _ in
                completion?()
            }
            .disposed(by: disposeBag)
    }
}
