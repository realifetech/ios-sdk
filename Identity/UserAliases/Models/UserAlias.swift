//
//  UserAlias.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2022/3/23.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct UserAlias {

    public let userAliasType: String?
    public let value: String?

    public init(userAliasType: String?, value: String?) {
        self.userAliasType = userAliasType
        self.value = value
    }
}

extension UserAlias {

    init(response: ApolloType.GetUserAliasesQuery.Data.Me.User.UserAlias?) {
        self.value = response?.value
        self.userAliasType = response?.userAliasType?.userAliasType
    }
}
