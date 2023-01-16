//
//  WalletPass.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/11.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct WalletPass {
    public var url: String?

    public init(url: String?) {
        self.url = url
    }
}

extension WalletPass {

//    init?(response: ApolloType.GetMyTicketWalletPassQuery.Data) {
//        guard let ticketWalletPass = response.getMyTicketWalletPass else { return nil }
//        url = ticketWalletPass.url
//    }
}
