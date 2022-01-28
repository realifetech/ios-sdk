//
//  IdentityPersister.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 28/01/2022.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation

class IdentityPersister: IdentityPersisting {

    private let defaults: UserDefaults
    private let userIdKey: String = "RLT.Identity.userId"

    init(defaults: UserDefaults) {
        self.defaults = defaults
    }

    func persist(userId: String) {
        defaults.set(userId, forKey: userIdKey)
    }

    func retrieveUserId() -> String? {
        return defaults.string(forKey: userIdKey)
    }

    func clear() {
        defaults.removeObject(forKey: userIdKey)
    }
}
