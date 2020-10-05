//
//  EnvironmentVariables.swift
//  APIUtilities
//
//  Created by Olivier Butler on 02/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

public protocol RealifeApiHeaderVariableHolding {
    var deviceID: String { get }
    var token: String? { get }
    var tokenIsValid: Bool { get }

    func getValidToken(_: (() -> Void)?)
}

struct EmptyHeaderVariables: RealifeApiHeaderVariableHolding {

    var deviceID: String = ""
    var token: String?
    var tokenIsValid: Bool = false

    func getValidToken(_ completion: (() -> Void)?) {
        completion?()
    }
}

protocol SharedApiHeaderVaribleStorage {
    static var sharedInstance: RealifeApiHeaderVariableHolding { get }
}

public class RealifeApiHeaderVariables: RealifeApiHeaderVariableHolding, SharedApiHeaderVaribleStorage {

    static var sharedInstance: RealifeApiHeaderVariableHolding = EmptyHeaderVariables()

    public var deviceID: String
    public var token: String? { authorisationStore.accessToken }
    public var tokenIsValid: Bool { authorisationStore.accessTokenValid }

    private let authorisationStore: AuthorisationStoring
    private let oAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating

    private let disposeBag: DisposeBag = DisposeBag()

    init(deviceID: String, authorisationStore: AuthorisationStore, oAuthRefreshOrWaitActionGenerator: OAuthRefreshOrWaitActionGenerating) {
        self.authorisationStore = authorisationStore
        self.oAuthRefreshOrWaitActionGenerator = oAuthRefreshOrWaitActionGenerator
        self.deviceID = deviceID
    }

    public func getValidToken(_ completion: (() -> Void)?) {
        guard let getTokenObservable = oAuthRefreshOrWaitActionGenerator.refreshTokenOrWaitAction else {
            completion?()
            return
        }
        getTokenObservable
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .catchError { _ in
                Observable.just(())
            }
            .subscribe { _ in
                completion?()
            }
            .disposed(by: disposeBag)
    }
}
