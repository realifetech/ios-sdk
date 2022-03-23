//
//  UserAliasesProvidable.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2022/3/23.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation

public protocol UserAliasesProvidable {

    func getUserAliases(callback: @escaping (Result<[UserAlias]?, Error>) -> Void)
}
