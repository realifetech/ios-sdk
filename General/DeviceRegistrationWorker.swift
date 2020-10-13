//
//  DeviceRegistrationWorker.swift
//  General
//
//  Created by Olivier Butler on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Repositories
import RxSwift
import RxCocoa

protocol DeviceRegistrationWorkerProtocol {
    func registerDevice(_: Device, _: @escaping(Result<Void, Error>) -> Void)
}

class DeviceRegistrationWorker: DeviceRegistrationWorkerProtocol {

    let disposeBag: DisposeBag

    init() {
        self.disposeBag = DisposeBag()
    }

    func registerDevice(_ device: Device, _ completion: @escaping (Result<Void, Error>) -> Void) {
        DeviceRepository
            .registerDevice(device)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { registered in
                completion(.success(()))
            }, onError: { error in
                completion(.failure(error))
            }).disposed(by: disposeBag)
    }
}
