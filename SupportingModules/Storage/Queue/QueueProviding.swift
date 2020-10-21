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
