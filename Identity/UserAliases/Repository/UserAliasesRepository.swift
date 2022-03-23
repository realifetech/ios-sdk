//
//  UserAliasesRepository.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2022/3/23.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public final class UserAliasesRepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }
}

extension UserAliasesRepository: UserAliasesProvidable {

    public func getUserAliases(callback: @escaping (Result<[UserAlias]?, Error>) -> Void) {
        graphQLManager.dispatch(
            query: ApolloType.GetUserAliasesQuery(),
            cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let response):
                let userAliases = response.data?.me?.user?.userAliases?.compactMap {
                    UserAlias(response: $0)
                }
                callback(.success(userAliases))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
