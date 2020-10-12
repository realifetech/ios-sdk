//
//  GraphQLDispatcher.swift
//  General
//
//  Created by Jonathon Albert on 09/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation
import Apollo

public struct GraphQLDispatcher {

    let client: GraphNetwork

    public init(client: GraphNetwork) {
        self.client = client
    }

    public func dispatch<T: GraphQLQuery>(
        query: T,
        completion: @escaping (Result<GraphQLResult<T.Data>, Error>) -> Void
    ) {
        client.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                return completion(.success(graphQLResult))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }

    public func dispatchMutation<T: GraphQLMutation>(
        mutation: T,
        completion:  @escaping (Result<GraphQLResult<T.Data>, Error>) -> Void
    ) {
        client.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                return completion(.success(graphQLResult))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
}
