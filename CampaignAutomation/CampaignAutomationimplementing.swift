//
//  CampaignAutomationimplementing.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct CAGetContentResponseItem {
    let campaignId: String?
    let contentType: String?
    let data: [String: Any?]?
    var unwrappedContentType: RLTContentType {
        RLTContentType(rawValue: contentType ?? "") ?? .unknown
    }
    var unwrappedDataModel: RLTDataModel? {
        return unwrappedContentType.correspondingDataModel?.create(json: data)
    }
}

public class CampaignAutomationImplementing: CampaignAutomation {

    private let graphQLManager: GraphQLManageable
    private let defaultFetcher: RLTViewFetcher
    private let analyticsLogger: Analytics

    init(graphQLManager: GraphQLManageable, defaultFetcher: RLTViewFetcher, analyticsLogger: Analytics) {
        self.graphQLManager = graphQLManager
        self.defaultFetcher = defaultFetcher
        self.analyticsLogger = analyticsLogger
    }

    public var viewFetcher: RLTViewFetcher {
        return defaultFetcher
    }

    public func generateCreatables(for location: String,
                                   factories: [RLTContentType: RLTCreatableFactory],
                                   completion: @escaping (Result<[RLTCreatable], Error>) -> Void) {
        fetchData(location: location) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let responseItems): completion(.success(self.buildCreatables(for: location,
                                                                                  from: responseItems,
                                                                                  using: factories)))
            }
        }
    }

    public func buildCreatables(for location: String,
                                from responseItems: [CAGetContentResponseItem],
                                using factories: [RLTContentType: RLTCreatableFactory]) -> [RLTCreatable] {
        let creatables: [RLTCreatable?] = responseItems.map {
            guard let factory = factories[$0.unwrappedContentType],
                  var data = $0.unwrappedDataModel else { return nil }
            let eventDictionary = createAnalyticEventDictionary(campaignId: $0.campaignId,
                                                                externalId: location,
                                                                contentId: data.id,
                                                                contentType: $0.contentType,
                                                                languageCode: data.language)
            logEvent(.loadContent, new: eventDictionary)
            if var linkHandling = data as? RLTLinkHandling & RLTDataModel {
                linkHandling.linkAnalyticsEvent = { [weak self] in
                    self?.logEvent(.interactWithContent, new: eventDictionary)
                }
                data = linkHandling
            }
            return factory.create(from: data)
        }
        return creatables.compactMap { $0 }
    }

    private func fetchData(location: String,
                           completion: @escaping (Result<[CAGetContentResponseItem], Error>) -> Void) {
        /*
        let responseItems = [
            CAGetContentResponseItem(campaignId: "1", contentType: "banner", data: ["title": "Banner title",
                                                                         "subtitle": "Banner subtitle",
                                                                         "url": "https://google.com"]),
            CAGetContentResponseItem(campaignId: "1", contentType: "ticket", data: ["eventName": "Event 1"]),
            CAGetContentResponseItem(campaignId: "1", contentType: "ticket", data: ["eventName": "Event 2"]),
            CAGetContentResponseItem(campaignId: "1", contentType: "product", data: ["price": 2.0])
        ]
        completion(.success(responseItems))
        */
        graphQLManager.dispatch(
            query: ApolloTypeCA.GetContentByExternalIdQuery(externalId: location),
            cachePolicy: .returnCacheDataAndFetch) { result in
            switch result {
            case .success(let response):
                guard let data = response.data?.getContentByExternalId,
                      let items = data.items else { return completion(.success([])) }
                let responseItems = items.map({ item in
                    CAGetContentResponseItem(campaignId: data.campaignId,
                                             contentType: item?.contentType?.rawValue ?? "unknown",
                                             data: item?.data)
                })
                completion(.success(responseItems))
            case .failure(let error): completion(.failure(error))
            }
        }
    }

    private enum AnalyticEventAction: String {
        case loadContent, interactWithContent
    }

    private func logEvent(_ action: AnalyticEventAction, new: [String: Any]) {
        let event = AnalyticEvent(type: "user", action: action.rawValue, new: new, version: "TODO-make-optional")
        analyticsLogger.logEvent(event, completion: {_ in})
    }

    public func createAnalyticEventDictionary(campaignId: String?,
                                              externalId: String,
                                              contentId: Int?,
                                              contentType: String?,
                                              languageCode: String?) -> [String: Any] {
        return ["campaignId": campaignId ?? "0",
                "externalId": externalId,
                "contentId": contentId ?? 0,
                "contentType": contentType ?? "",
                "languageCode": languageCode ?? ""]
    }
}
