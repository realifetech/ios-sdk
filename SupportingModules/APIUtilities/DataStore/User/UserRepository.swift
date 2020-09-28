//
//  UserRepository.swift
//  CLArena
//
//  Created by apple on 11/04/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import APILayer
import RxSwift

struct UserRepository: RemoteDiskCacheDataProviding, DefaultV3DiskCacheStrategyProviding {
    typealias Cdble = RxUser
    typealias Rqstr = UserRequester
}

extension UserRepository {
    struct SocialLoginResponse: Codable {
        let authorizationCode: String?
    }

    static func profile(withID id: String? = nil, forceUpdate: Bool = false) -> Observable<Cdble> {
        let strategy: DiskCacheDataProvidingStrategy = forceUpdate ? .localAndForcedRemote : .localAndRemote
        return retrieve(type: Cdble.self, forRequest: Rqstr.profile(withID: id), strategy: strategy).map {
            UserProfileDataManager.sharedInstance.updateUserProfile(token: $0.token)
            return $0
        }
    }
}
