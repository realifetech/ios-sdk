//
//  SSOProvidable.swift
//  RealifeTech
//
//  Created by Aleksandrs Proskurins on 31/01/2022.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation

public protocol SSOProvidable {

    func getMyUserSSO(callback: @escaping (Result<String?, Error>) -> Void)
}
