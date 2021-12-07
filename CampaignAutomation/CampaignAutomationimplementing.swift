//
//  CampaignAutomationimplementing.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

private struct RLTResponseItem {
    let contentType: String
    let data: [String: Any]
    var unwrappedContentType: RLTContentType {
        RLTContentType(rawValue: contentType) ?? .unknown
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
            case .success(let responseItems):
                let creatables: [RLTCreatable?] = responseItems.map {
                    guard let factory = factories[$0.unwrappedContentType],
                          let data = $0.unwrappedDataModel else { return nil }
//                    logLoadEvent()
                    return factory.create(from: data)
                }
                completion(.success(creatables.compactMap { $0 }))
            }
        }
    }

    private func fetchData(location: String, completion: (Result<[RLTResponseItem], Error>) -> Void) {
        let responseItems = [
            RLTResponseItem(contentType: "banner", data: ["title": "Banner title", "link": "https://google.com"]),
            RLTResponseItem(contentType: "ticket", data: ["eventName": "Event 1"]),
            RLTResponseItem(contentType: "ticket", data: ["eventName": "Event 2"]),
            RLTResponseItem(contentType: "product", data: ["price": 2.0])
        ]
        completion(.success(responseItems))
    }

    /*
     ["campaignId": 123,
               "externalId": "homepage-top-view",
               "contentId": 123,
               "contentType": "banner",
               "languageCode": "en"]
     */
    private func logLoadEvent(campaignId: Int,
                              externalId: String,
                              contentId: String,
                              contentType: String,
                              languageCode: String) {
        let event = AnalyticEvent(type: "user", action: "loadContent", new: [:], version: "TODO")
        analyticsLogger.logEvent(event, completion: {_ in})
    }
}
