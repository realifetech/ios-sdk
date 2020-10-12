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

public class AudiencesImplementing: AudienceChecking {

    let graphQLAPIUrl: String
    let dispatcher: GraphQLDispatcher?

    public init(tokenHelper: V3APITokenManagable, graphQLAPIUrl: String, deviceId: String) {
        self.graphQLAPIUrl = graphQLAPIUrl
        if let graphQLUrl = URL(string: graphQLAPIUrl) {
            let client = GraphNetwork(graphQLAPIUrl: graphQLUrl,
                                      tokenHelper: tokenHelper,
                                      deviceId: deviceId)
            self.dispatcher = GraphQLDispatcher(client: client)
        } else {
            self.dispatcher = nil
        }
    }

    public func deviceIsMemberOfAudience(audienceId: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        dispatcher?.dispatch(query: BelongsToAudienceQuery(audienceId: audienceId)) { result in
            switch result {
            case .success(let response):
                return completion(.success(response.data?.me?.device?.belongsToAudience ?? false))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
}
