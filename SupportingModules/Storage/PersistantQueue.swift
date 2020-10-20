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

    var next: Result<PersistantQueueItem<QueueItem>, QueueRetreivalError> { get }
    var count: Int { get }
    var isEmpty: Bool { get }

    func addToQueue(_ items: QueueItem)
}

enum QueueAction {
    case removeFirst, sendFirstToBack, nothing
}

enum QueueRetreivalError: Error {
    case empty, queueIsLocked
}

struct PersistantQueueItem <T: Codable> {
    let item: T
    let itemCompletion: (_: QueueAction) -> Void
}

protocol Identifiable {
    var uniqueId: UUID { get }
}

class PersistantQueue<T: Codable & Identifiable>: QueueProviding {

    var next: Result<PersistantQueueItem<T>, QueueRetreivalError> { getNextQueueItem() }
    var count: Int { queue.count }
    var isEmpty: Bool { queue.isEmpty }
    var locked: Bool = false

    private var queue: [T] = []
    private let storage: CodableStorage

    init(name: String) {
        self.storage = CodableStorage(
            storage: DiskStorage(path: URL(fileURLWithPath: NSTemporaryDirectory())),
            storagePrefix: name)
        guard let storedQueue: [T] = try? storage.fetchAll() else { return }
        queue = storedQueue
    }

    func addToQueue(_ item: T) {
        do {
            try storage.save(item, for: item.uniqueId.uuidString)
            queue.append(item)
        } catch {
            print(error)
        }
    }

    /// Provides an item from the queue. Calling will lock the queue
    func getNextQueueItem() -> Result<PersistantQueueItem<T>, QueueRetreivalError> {
        if locked {
            return .failure(.queueIsLocked)
        } else if let nextItem = queue.first {
            locked = true
            let nextQueueItem = PersistantQueueItem(item: nextItem, itemCompletion: finishCurrentItem)
            return(.success(nextQueueItem))
        } else {
            return .failure(.empty)
        }
    }

    func finishCurrentItem(_ action: QueueAction) {
        switch action {
        case .removeFirst:
            guard !queue.isEmpty else {
                return
            }
            let currentItem = queue.removeFirst()
            storage.delete(key: currentItem.uniqueId.uuidString)
        case .sendFirstToBack:
            let frontOfQueue = queue.removeFirst()
            queue.append(frontOfQueue)
        case .nothing:
            break
        }
        locked = false
    }
}
