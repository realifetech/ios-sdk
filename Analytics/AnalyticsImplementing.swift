//
//  AnalyticsImplementing.swift
//  Analytics
//
//  Created by Jonathon Albert on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import APIV3Utilities
import GraphQL

public class AnalyticsImplementing: AnalyticsLogging {

    var dispatcher: GraphQLDispatching?
    let storage = CodableStorage(storage: DiskStorage(path: URL(fileURLWithPath: NSTemporaryDirectory())))

    public init(tokenHelper: V3APITokenManagable, graphQLAPIUrl: String, deviceId: String) {
        if let graphQLUrl = URL(string: graphQLAPIUrl) {
            let client = GraphNetwork(graphQLAPIUrl: graphQLUrl,
                                      tokenHelper: tokenHelper,
                                      deviceId: deviceId)
            self.dispatcher = GraphQLDispatcher(client: client)
            getOfflineEvents()
        } else {
            self.dispatcher = nil
        }
    }

    func getOfflineEvents() {
        do {
            let cached: AnalyticsEvent = try storage.fetch(for: "event1")
            print(cached)
        } catch {
            print(error)
        }
    }

    func saveEventOffline(event: AnalyticsEvent) {
        do {
            try storage.save(event, for: "event1")
        } catch {
            print(error)
        }
    }

    public func logEvent(_ event: AnalyticsEvent, completion: @escaping (_ error: Error?) -> Void) {
        let graphEvent = AnalyticEvent(
            type: event.type,
            action: event.action,
            new: event.newString,
            old: event.oldString,
            version: event.version
        )
        let mutation = PutAnalyticEventMutation(input: graphEvent)
        saveEventOffline(event: event)
        dispatcher?.dispatchMutation(mutation: mutation, completion: { result in
            switch result {
            case .success:
                return completion(nil)
            case .failure(let error):
                return completion(error)
            }
        })
    }
}