//
//  AudiencesImplementing.swift
//  Audiences
//
//  Created by Jonathon Albert on 07/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public class AudiencesImplementing: AudienceChecking {

    let graphQLManager: GraphQLManageable

    public init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }

    public func deviceIsMemberOfAudience(audienceId: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        graphQLManager.dispatch(
            query: ApolloType.BelongsToAudienceWithExternalIdQuery(externalAudienceId: audienceId),
            cachePolicy: .returnCacheDataElseFetch) { result in
            switch result {
            case .success(let response):
                return completion(.success(response.data?.me?.device?.belongsToAudienceWithExternalId ?? false))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
}
