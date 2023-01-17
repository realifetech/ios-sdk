//
//  Access.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/11.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation

public protocol Access {
    func getWalletPass(ticketId: String, completion: @escaping (Result<WalletPass?, Error>) -> Void)
}
