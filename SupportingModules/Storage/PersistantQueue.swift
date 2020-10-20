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

    var next: Result<NextQueueItem<QueueItem>, QueueRetreivalError> { get }
    var count: Int { get }
    var isEmpty: Bool { get }

    func addToQueue(_ items:[QueueItem])
}

enum QueueItemAction {
    case removeFromQueue, sendToBack, leaveAtFront
}

enum QueueRetreivalError: Error {
    case empty, itemAlreadyProcessing
}

struct NextQueueItem <T: Codable> {
    let item: T
    let itemCompletion: (_: QueueItemAction) -> ()
}

class PersistantQueue<T: Codable>: QueueProviding {

    var next: Result<NextQueueItem<T>, QueueRetreivalError> { getNextQueueItem() }
    var count: Int { queue.count }
    var isEmpty: Bool { queue.isEmpty }

    private var queue: [T] = []
    private var currentItem: T?
    private let storage = CodableStorage(storage: DiskStorage(path: URL(fileURLWithPath: NSTemporaryDirectory())))

    func addToQueue(_ items:[T]) {
        queue.append(contentsOf: items)
    }

    func getNextQueueItem() -> Result<NextQueueItem<T>, QueueRetreivalError> {
        if currentItem != nil {
            return .failure(.itemAlreadyProcessing)
        } else if let nextItem = queue.first {
            currentItem = nextItem
            let nextQueueItem = NextQueueItem(item: nextItem, itemCompletion: finishCurrentItem)
            return(.success(nextQueueItem))
        } else {
            return .failure(.empty)
        }
    }

    func finishCurrentItem(_ action: QueueItemAction) {
        switch action {
        case .removeFromQueue:
            _ = queue.removeFirst()
        case .sendToBack:
            let frontOfQueue = queue.removeFirst()
            queue.append(frontOfQueue)
        case .leaveAtFront:
            break
        }
        currentItem = nil
    }
}
