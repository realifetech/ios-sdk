//
//  AudiencesImplementing.swift
//  Audiences
//
//  Created by Jonathon Albert on 07/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation
import RealifeTech_CoreSDK

public class AudiencesImplementing: AudienceChecking {

    let dispatcher: GraphQLDispatching

    public init(dispatcher: GraphQLDispatching) {
        self.dispatcher = dispatcher
    }

    public func deviceIsMemberOfAudience(audienceId: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        dispatcher.dispatch(
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
