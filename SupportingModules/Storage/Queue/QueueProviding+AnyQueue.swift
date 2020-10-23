//
//  QueueProviding.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

protocol QueueProviding {

    associatedtype ItemType: Codable

    var next: Result<QueueItem<ItemType>, QueueRetreivalError> { get }
    var count: Int { get }
    var isEmpty: Bool { get }

    func addToQueue(_ items: ItemType)
}

struct AnyQueue<ItemType: Codable> {

    private var internalAddToQueue: (_ items: ItemType) -> Void
    private var internalNext: () -> Result<QueueItem<ItemType>, QueueRetreivalError>
    private var internalCount: () -> Int
    private var internalIsEmpty: () -> Bool

    var next: Result<QueueItem<ItemType>, QueueRetreivalError> { internalNext() }
    var count: Int { internalCount() }
    var isEmpty: Bool { internalIsEmpty() }

    init<Q: QueueProviding>(_ queue: Q) where Q.ItemType == ItemType {
        self.internalAddToQueue = queue.addToQueue
        self.internalNext = { queue.next }
        self.internalCount = { queue.count }
        self.internalIsEmpty = { queue.isEmpty }
    }

    func addToQueue(_ items: ItemType) {
        internalAddToQueue(items)
    }
}
