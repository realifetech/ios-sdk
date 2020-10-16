//
//  GeneralImplementing.swift
//  General
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

public class GeneralImplementing: DeviceRegistering {

    public var sdkReady: Bool {
        print("someone asked if the SDK was ready")
        return hasRegistered
    }
    var hasRegistered: Bool = false
    private var disposeBag = DisposeBag()

    public let deviceId: String

    public init(deviceId: String) {
        self.deviceId = deviceId
    }

    public func registerDevice(_ completion: @escaping(Result<Void, Error>) -> Void) {
        print("Someone wanted to register the device")
        let device = Device(deviceId: deviceId,
                            model: "OlivierPhone",
                            sdkVersion: "0.0.1alpha",
                            osVersion: "4",
                            bluetoothOn: false,
                            wifiConnected: true)
        DeviceRepository
            .registerDevice(device)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { registered in
                if registered { self.hasRegistered = true }
                completion(.success(()))
            }, onError: { error in
                completion(.failure(error))
            }).disposed(by: disposeBag)
    }
}
