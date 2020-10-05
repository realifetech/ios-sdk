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
    let device = Device(token: RealifeApiHeaderVariables.sharedInstance.token ?? "",
                        type: "IOS",
                        appVersion: "sdk_0.0.1alpha",
                        osVersion: "13.3")
    DeviceRepository.register(device: device)
        .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { success in
            print("I gots a token!", success)
        }, onError: { error in
            print("I gots a error, not a token!", error)
        }).disposed(by: bag)
}
