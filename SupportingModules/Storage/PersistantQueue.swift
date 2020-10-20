//
//  PersistantQueue.swift
//  RealifeTech
//
//  Created by Olivier Butler on 20/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

protocol QueueProviding {
    associatedtype QueueItem: Codable

    var next: NextQueueItem<QueueItem>? { get }
    var count: Int { get }
    var isEmpty: Bool { get }

    func addToQueue(_ items:[QueueItem])
}

enum QueueItemAction {
    case removeFromQueue, sendToBack, leaveAtFront
}

enum QueueRetreivalError: Error {

}

struct NextQueueItem <T: Codable> {
    let item: T
    let itemCompletion: (_: QueueItemAction) -> ()
}

class PersistantQueue<T: Codable>: QueueProviding {

    var next: NextQueueItem<T>? { get }
    var count: Int { queue.count }
    var isEmpty: Bool { queue.isEmpty }

    private var queue: [T] = []
    private var nextItem: T?

    func addToQueue(_ items:[T]) {
        queue.append(contentsOf: items)
    }
}
