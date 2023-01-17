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
        graphQLManager.dispatch(
            query: ApolloType.GetMyTicketWalletPassQuery(ticketId: ticketId),
            cachePolicy: .returnCacheDataElseFetch
        ) { result in
                switch result {
                case .success(let response):
                    guard let data = response.data else {
                        return completion(.failure(GraphQLManagerError.noDataError))
                    }
                    let walletPass = WalletPass(response: data)
                    completion(.success(walletPass))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}
