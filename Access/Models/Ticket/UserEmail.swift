//
//  UserEmail.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/30.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct UserEmail: Codable {
    public let id: String?
    public let email: String?
    public let valid: Bool?

    public init(
        id: String?,
        email: String?,
        valid: Bool?
    ) {
        self.id = id
        self.email = email
        self.valid = valid
    }
}

extension UserEmail {

    init(response: ApolloType.FragmentTicketAuth.UserEmail?) {
        self.id = response?.id
        self.email = response?.email
        self.valid = response?.valid
    }
}
