//
//  ContentImplementing.swift
//  RealifeTech
//
//  Created by Mickey Lee on 02/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import RealifeTech_CoreSDK

public class ContentImplementing: Content {

    let dispatcher: GraphQLDispatching

    public init(dispatcher: GraphQLDispatching) {
        self.dispatcher = dispatcher
    }

    public func getWebPage(forType type: WebPage.`Type`, completion: @escaping (Result<WebPage, Error>) -> Void) {
        makeGetWebPageQuery(by: type, completion: completion)
    }

    public func createWebPageView(forType type: WebPage.`Type`, completion: @escaping (UIViewController) -> Void) {
        makeGetWebPageQuery(by: type) { result in
            let webPageViewController = WebPageViewController(result: result, delegate: nil)
            completion(webPageViewController)
        }
    }

    private func makeGetWebPageQuery(by type: WebPage.`Type`, completion: @escaping (Result<WebPage, Error>) -> Void) {
        let pageType = ApolloWebPageType(rawValue: type.rawValue)
        dispatcher.dispatch(
            query: ApolloType.GetWebPageByTypeQuery(type: pageType),
            cachePolicy: .returnCacheDataElseFetch) { result in
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
