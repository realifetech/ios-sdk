//
//  ContentImplementing.swift
//  RealifeTech
//
//  Created by Mickey Lee on 02/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public class ContentImplementing: Content {

    let graphQLManager: GraphQLManageable

    public init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }

    public func getWebPage(
        forType type: WebPage.`Type`,
        completion: @escaping (Result<WebPage, Error>) -> Void
    ) {
        let pageType = ApolloWebPageType(rawValue: type.rawValue)
        graphQLManager.dispatch(
            query: ApolloType.GetWebPageByTypeQuery(type: pageType),
            cachePolicy: .returnCacheDataAndFetch) { result in
            switch result {
            case .success(let response):
                guard let urlString = response.data?.getWebPageByType?.url else {
                    return completion(.failure(ContentError.urlIsEmpty))
                }
                guard let url = URL(string: urlString) else {
                    return completion(.failure(ContentError.constructUrlFailure))
                }
                completion(.success(WebPage(url: url)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
