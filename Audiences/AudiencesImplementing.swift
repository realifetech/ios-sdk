//
//  AudiencesImplementing.swift
//  Audiences
//
//  Created by Jonathon Albert on 07/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation
import APIV3Utilities
import GraphQL
import Apollo

public class AudiencesImplementing: AudienceChecking {

    let graphQLAPIUrl: String
    let dispatcher: GraphQLDispatcher?

    public init(tokenHelper: V3APITokenManagable, graphQLAPIUrl: String) {
        self.graphQLAPIUrl = graphQLAPIUrl
        if let graphQLUrl = URL(string: graphQLAPIUrl) {
            let client = GraphNetwork(graphQLAPIUrl: graphQLUrl, tokenHelper: tokenHelper)
            self.dispatcher = GraphQLDispatcher(client: client)
        } else {
            self.dispatcher = nil
        }
    }

    public func deviceIsMemberOfAudience(audienceId: String, callback: @escaping (Result<Bool, Error>) -> Void) {
        dispatcher?.dispatch(query: BelongsToAudienceQuery(audienceId: audienceId)) { (object, error) in
            if let error = error {
                return callback(.failure(error))
            } else if let belongsToAudience = object?.me?.device?.belongsToAudience {
                return callback(.success(belongsToAudience))
            } else {
                return callback(.success(false))
            }
        }
    }
}
