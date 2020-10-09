//
//  AudiencesImplementing.swift
//  Audiences
//
//  Created by Jonathon Albert on 07/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation
import General
import GraphQL

public class AudiencesImplementing: AudienceChecking, SDKConfigurable {

    public init() {}

    public func deviceIsMemberOfAudience(audienceId: String, callback: @escaping (Result<Bool, Error>) -> Void) {
        GraphQLDispatcher.dispatch(query: BelongsToAudienceQuery(audienceId: audienceId)) { (object, error) in
            if let error = error {
                return callback(.failure(error))
            } else if let belongsToAudience = object?.me?.device?.belongsToAudience {
                return callback(.success(belongsToAudience))
            } else {
                return callback(.success(false))
            }
        }
    }

    public func setConfiguration(_: SDKConfiguration) {
    }
}
