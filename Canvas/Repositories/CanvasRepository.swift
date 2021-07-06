//
//  CanvasRepository.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public final class CanvasRepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }
}

extension CanvasRepository: WidgetProvidable {

    public func getWidgets(
        for screenType: ScreenType,
        pageSize: Int,
        page: Int?,
        callback: @escaping (Result<PaginatedObject<Widget>, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetWidgetsByScreenTypeQuery(
                type: screenType.apolloType,
                pageSize: pageSize,
                page: page),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                let items = response.data?.getWidgetsByScreenType?.edges?.compactMap {
                    Widget(response: $0?.fragments.fragmentWidget)
                }
                let paginatedObject = PaginatedObject<Widget>(
                    items: items ?? [],
                    nextPage: response.data?.getWidgetsByScreenType?.nextPage)
                callback(.success(paginatedObject))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func getWidgets(
        for screenId: String,
        pageSize: Int,
        page: Int?,
        callback: @escaping (Result<PaginatedObject<Widget>, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetWidgetsByScreenIdQuery(
                screenId: screenId,
                pageSize: pageSize,
                page: page),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                let items = response.data?.getWidgetsByScreenId?.edges?.compactMap {
                    Widget(response: $0?.fragments.fragmentWidget)
                }
                let paginatedObject = PaginatedObject<Widget>(
                    items: items ?? [],
                    nextPage: response.data?.getWidgetsByScreenId?.nextPage)
                callback(.success(paginatedObject))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

extension CanvasRepository: ScreenProvidable {

    public func getScreenTitle(
        for screenType: ScreenType,
        currentLanguageCode: String,
        callback: @escaping (Result<String, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetScreenByScreenTypeQuery(type: screenType.apolloType),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                let translations = response.data?.getScreenByScreenType?.translations
                guard
                    let currentTranslation = translations?.first(where: { $0.language.rawValue == currentLanguageCode })
                else {
                    let firstTranslation = translations?.first?.title
                    return callback(.success(firstTranslation ?? ""))
                }
                callback(.success(currentTranslation.title))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func getScreenTitle(
        for screenId: String,
        currentLanguageCode: String,
        callback: @escaping (Result<String, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetScreenByIdQuery(id: screenId),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                let translations = response.data?.getScreenById?.translations
                guard
                    let currentTranslation = translations?.first(where: { $0.language.rawValue == currentLanguageCode })
                else {
                    let firstTranslation = translations?.first?.title
                    return callback(.success(firstTranslation ?? ""))
                }
                callback(.success(currentTranslation.title))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
