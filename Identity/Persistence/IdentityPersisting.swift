//
//  IdentityPersisting.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 28/01/2022.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation

protocol IdentityPersisting {
    func persist(userId: String)
    func retrieveUserId() -> String?
    func clear()
}
