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
    public static func dispatch<T: GraphQLQuery>(
        query: T,
        completion: @escaping (_ object: T.Data?, _ error: Error?) -> Void) {
        Network.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                return completion(graphQLResult.data, nil)
            case .failure(let error):
                return completion(nil, error)
            }
        }
    }

    public static func dispatchMutation<T: GraphQLMutation>(
        mutation: T,
        completion:  @escaping (_ object: T.Data?, _ error: Error?) -> Void) {
        Network.shared.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                return completion(graphQLResult.data, nil)
            case .failure(let error):
                return completion(nil, error)
            }
        }
    }
}
