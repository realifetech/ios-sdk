//
//  DeviceRequester.swift
//  CLArena
//
//  Created by Ross Patman on 10/09/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import APILayer
import RxSwift

let bag: DisposeBag = DisposeBag()

public func testMethod() {
    APIV3RequesterHelper.tokenManager.getValidToken {
        print("🖨️ TestFile: We got a valid token, apprently, now it's time to register")
        let device = Device(token: APIV3RequesterHelper.tokenManager.token ?? "",
                            type: "IOS",
                            appVersion: "sdk_0.0.1alpha",
                            osVersion: "13.3")
        DeviceRepository.register(device: device)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { success in
                print("We registered the deivce!", success)
            }, onError: { error in
                print("No device registration for you!", error)
            }).disposed(by: bag)
    }
}
