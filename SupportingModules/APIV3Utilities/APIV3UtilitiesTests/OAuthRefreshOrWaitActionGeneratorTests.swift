//
//  OAuthRefreshOrWaitActionGeneratorTests.swift
//  APIV3UtilitiesTests
//
//  Created by Olivier Butler on 08/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
@testable import APIV3Utilities

class OAuthRefreshOrWaitActionGeneratorTests: XCTestCase {

    let emptyToken = OAuthToken(accessToken: nil,
                                refreshToken: nil,
                                expiresIn: nil,
                                tokenType: nil,
                                scope: nil)

    func test_refreshOrWaitAction_noRefreshValidToken() {
        let store = MockStore()
        let watcher = MockWatcher()
        let worker = MockWorker(oAuthTokenObservable: Observable.just(emptyToken))
        let sut = OAuthRefreshOrWaitActionGenerator(
            authorisationWorker: worker,
            oAuthTokenRefreshWatcher: watcher,
            authorisationStore: store)
        store.accessTokenValid = true
        watcher.ongoingTokenRefresh = nil
        XCTAssertNil(sut.refreshTokenOrWaitAction)
    }

    func test_refreshOrWaitAction_refreshInProgress() {
        let scheduler = TestScheduler(initialClock: 0)
        let disposeBag = DisposeBag()
        let refreshCompleteStream = scheduler.createColdObservable([
            Recorded.next(100, true),
            Recorded.next(300, true),
            Recorded.completed(500)])
        let watcher = MockWatcher()
        watcher.ongoingTokenRefresh = refreshCompleteStream.asObservable()
        let store = MockStore()
        let worker = MockWorker(oAuthTokenObservable: Observable.just(emptyToken))
        let sut = OAuthRefreshOrWaitActionGenerator(
            authorisationWorker: worker,
            oAuthTokenRefreshWatcher: watcher,
            authorisationStore: store)
        guard let outputStream = sut.refreshTokenOrWaitAction else {
            return XCTFail("No refreshOrWait observable provided")
        }
        let observer = scheduler.createObserver(Bool.self)
        outputStream
            .asDriver(onErrorJustReturn: Void())
            .map({ _ in return true }) // We have to map to a Bool since Void is not equatable
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()

        let expectedEvents = [
            Recorded.next(100, true),
            Recorded.completed(100)
        ]
        XCTAssertEqual(expectedEvents, observer.events)
    }

    func test_refreshOrWaitAction_getToken() {
        let scheduler = TestScheduler(initialClock: 0)
        let disposeBag = DisposeBag()
        let tokenStream = scheduler.createColdObservable([
            Recorded.next(100, emptyToken),
            Recorded.next(300, emptyToken),
            Recorded.completed(500)])
        let watcher = MockWatcher()
        let store = MockStore()
        let worker = MockWorker(oAuthTokenObservable: tokenStream.asObservable())
        let sut = OAuthRefreshOrWaitActionGenerator(
            authorisationWorker: worker,
            oAuthTokenRefreshWatcher: watcher,
            authorisationStore: store)
        guard let outputStream = sut.refreshTokenOrWaitAction else {
            return XCTFail("No refreshOrWait observable provided")
        }
        let observer = scheduler.createObserver(Bool.self)
        outputStream
            .asDriver(onErrorJustReturn: Void())
            .map({ _ in return true }) // We have to map to a Bool since Void is not equatable
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()

        let expectedEvents = [
            Recorded.next(100, true),
            Recorded.completed(100)
        ]
        XCTAssertEqual(expectedEvents, observer.events)
    }

}

private class MockStore: AuthorisationStoring {

    var accessToken: String?
    var accessTokenValid: Bool = false

    func saveCredentials(token: String, secondsExpiresIn: Int) {}
    func removeCredentials() {}
}

private class MockWorker: AuthorisationWorkable {

    var requestInitialAccessToken: Observable<OAuthToken>

    init(oAuthTokenObservable: Observable<OAuthToken>) {
        self.requestInitialAccessToken = oAuthTokenObservable
    }
}

private final class MockWatcher: OAuthTokenRefreshWatchable {

    var ongoingTokenRefresh: Observable<Bool>?
    var refreshStatusValues: [OAuthTokenStatus] = []

    func updateRefreshingStatus(newValue: OAuthTokenStatus) {
        refreshStatusValues.append(newValue)
    }
}
