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
    var token: String { get }
    var tokenIsValid: Bool { get }

    func getValidToken(_: (() -> Void)?)
}

struct EmptyHeaderVariables: RealifeApiHeaderVariableHolding {

    var deviceID: String = ""
    var token: String = ""
    var tokenIsValid: Bool = false

    func getValidToken(_ completion: (() -> Void)?) {
        completion?()
    }
}

protocol SharedApiHeaderVaribleStorage {
    static var sharedInstance: RealifeApiHeaderVariableHolding { get }
}

public class RealifeApiHeaderVariables: RealifeApiHeaderVariableHolding, SharedApiHeaderVaribleStorage, OAuthRefreshOrWaitActionGenerator {

    static var sharedInstance: RealifeApiHeaderVariableHolding = EmptyHeaderVariables()

    public var deviceID: String = ""
    public var token: String { AuthorisationStore.accessToken ?? "" }
    public var tokenIsValid: Bool {
        AuthorisationStore.accessTokenValid
    }

    private let disposeBag: DisposeBag = DisposeBag()

    public func getValidToken(_ completion: (() -> Void)?) {
        guard let getTokenObservable = Self.refreshTokenOrWaitAction else {
            completion?()
            return
        }
        getTokenObservable
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .catchError { _ in
                Observable.just(true)
            }
            .subscribe { _ in
                completion?()
            }
            .disposed(by: disposeBag)
    }
}
