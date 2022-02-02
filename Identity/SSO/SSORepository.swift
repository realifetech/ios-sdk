//
//  SSORepository.swift
//  RealifeTech
//
//  Created by Aleksandrs Proskurins on 31/01/2022.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public final class SSORepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }
}

extension SSORepository: SSOProvidable {

    public func getMyUserSSO(callback: @escaping (Result<String?, Error>) -> Void) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyUserSsoQuery(),
            cachePolicy: .fetchIgnoringCacheData
        ) { result in
            switch result {
            case .success(let response):
                callback(.success(response.data?.getMyUserSso?.sub))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
