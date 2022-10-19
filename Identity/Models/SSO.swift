//
//  SSO.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2022/10/17.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct SSO {
    public var authUrl: String?

    public init(authUrl: String?) {
        self.authUrl = authUrl
    }
}

extension SSO {

    init?(response: ApolloType.GetSsoQuery.Data) {
        guard let sso = response.getSso else { return nil }
        authUrl = sso.authUrl
    }
}
