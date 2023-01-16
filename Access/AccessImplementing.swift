//
//  AccessImplementing.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/11.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public class AccessImplementing: Access {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }

    public func getWalletPass(ticketId: String, completion: @escaping (Result<WalletPass?, Error>) -> Void) {
        // TODO: implement getMyTicketWallet
        let walletPass = WalletPass(url: "https://release.audienceview.net:8080/app/pass?ticket_token=1,7503837d,63af04ab,29181931-D92D-4FDE-B543-65880863D83E,1Skp7T44QfYkPEyAvND3YM6jLHE=")
        completion(.success(walletPass))
    }
}
