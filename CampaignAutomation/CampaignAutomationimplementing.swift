//
//  CampaignAutomationimplementing.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

private struct RLTResponseItem {
    let campaignId: Int?
    let contentType: String?
    let data: [String: Any]?
    var unwrappedContentType: RLTContentType {
        RLTContentType(rawValue: contentType ?? "") ?? .unknown
    }
    var unwrappedDataModel: RLTDataModel? {
        return unwrappedContentType.correspondingDataModel?.create(json: data)
    }
}

public class CampaignAutomationImplementing: CampaignAutomation {

    private let defaultFetcher: RLTViewFetcher
    private let analyticsLogger: Analytics

    init(defaultFetcher: RLTViewFetcher, analyticsLogger: Analytics) {
        self.defaultFetcher = defaultFetcher
        self.analyticsLogger = analyticsLogger
    }

    public var viewFetcher: RLTViewFetcher {
        return defaultFetcher
    }

    public func generateCreatables(for location: String,
                                   factories: [RLTContentType: RLTCreatableFactory],
                                   completion: (Result<[RLTCreatable], Error>) -> Void) {
        fetchData(location: location) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let responseItems): completion(.success(generateCreatables(for: location,
                                                                                     from: responseItems,
                                                                                     using: factories)))
            }
        }
    }

    private func generateCreatables(for location: String,
                                    from responseItems: [RLTResponseItem],
                                    using factories: [RLTContentType: RLTCreatableFactory]) -> [RLTCreatable] {
        let creatables: [RLTCreatable?] = responseItems.map {
            guard let factory = factories[$0.unwrappedContentType],
                  var data = $0.unwrappedDataModel else { return nil }
            let eventDictionary = eventDictionary(campaignId: $0.campaignId,
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

    private func fetchData(location: String, completion: (Result<[RLTResponseItem], Error>) -> Void) {
        let responseItems = [
            RLTResponseItem(campaignId: 1, contentType: "banner", data: ["title": "Banner title",
                                                                         "subtitle": "Banner subtitle",
                                                                         "link": "https://google.com"]),
            RLTResponseItem(campaignId: 1, contentType: "ticket", data: ["eventName": "Event 1"]),
            RLTResponseItem(campaignId: 1, contentType: "ticket", data: ["eventName": "Event 2"]),
            RLTResponseItem(campaignId: 1, contentType: "product", data: ["price": 2.0])
        ]
        completion(.success(responseItems))
    }

    private enum AnalyticEventAction: String {
        case loadContent, interactWithContent
    }

    private func logEvent(_ action: AnalyticEventAction, new: [String: Any]) {
        let event = AnalyticEvent(type: "user", action: action.rawValue, new: new, version: "TODO")
        analyticsLogger.logEvent(event, completion: {_ in})
    }

    private func eventDictionary(campaignId: Int?,
                                 externalId: String,
                                 contentId: Int?,
                                 contentType: String?,
                                 languageCode: String?) -> [String: Any] {
        return ["campaignId": campaignId ?? 0,
                "externalId": externalId,
                "contentId": contentId ?? 0,
                "contentType": contentType ?? "",
                "languageCode": languageCode ?? ""]
    }
}
