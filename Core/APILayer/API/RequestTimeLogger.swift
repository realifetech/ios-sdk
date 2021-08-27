//
//  RequestTimeLogger.swift
//  CLArena
//
//  Created by Mickey Lee on 11/06/2019.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

class RequestTimeLogger {

    static let shared = RequestTimeLogger()

    private let requestEntriesQueue: DispatchQueue
    private(set) var requestEntries: [String: Date]

    init(queue: DispatchQueue = DispatchQueue(label: "requestEntriesQueue")) {
        self.requestEntriesQueue = queue
        self.requestEntries = [:]
    }

    func addRequest(withIdentifier identifier: String, andDate date: Date = Date()) {
        requestEntriesQueue.async {
            self.requestEntries[identifier] = date
        }
    }

    func removeRequest(withIdentifier identifier: String) {
        requestEntriesQueue.async {
            self.requestEntries.removeValue(forKey: identifier)
        }
    }

    func containsSlowRequestsAndRemove() -> Bool {
        var isSlow = false
        for entry in requestEntries {
            guard isSlowRequest(requestDate: entry.value) else { continue }
            removeRequest(withIdentifier: entry.key)
            isSlow = true
        }
        return isSlow
    }

    private func isSlowRequest(requestDate: Date, currentDate: Date = Date()) -> Bool {
        return currentDate.timeIntervalSince(requestDate) >= 3
    }
}
