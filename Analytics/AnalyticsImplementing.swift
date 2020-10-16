//
//  AnalyticsImplementing.swift
//  Analytics
//
//  Created by Jonathon Albert on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public class AnalyticsImplementing: AnalyticsLogging {

    let dispatcher: EventSending
    let storage = CodableStorage(storage: DiskStorage(path: URL(fileURLWithPath: NSTemporaryDirectory())))

    public init(dispatcher: EventSending) {
        self.dispatcher = dispatcher
        getOfflineEvents()
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

    func logEvent(_ event: AnalyticsEvent, completion: @escaping (Error?) -> Void) {
        dispatcher.logEvent()
    }
}
