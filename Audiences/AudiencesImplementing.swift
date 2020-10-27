//
//  AudiencesImplementing.swift
//  Audiences
//
//  Created by Jonathon Albert on 07/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation

public class AudiencesImplementing: AudienceChecking {

    let dispatcher: GraphQLDispatching

    public init(dispatcher: GraphQLDispatching) {
        self.dispatcher = dispatcher
    }

    public func deviceIsMemberOfAudience(audienceId: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        dispatcher.dispatch(query: Apollo.BelongsToAudienceQuery(audienceId: audienceId)) { result in
            switch result {
            case .success(let response):
                return completion(.success(response.data?.me?.device?.belongsToAudience ?? false))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
}
