//
//  CodableStorage.swift
//  RealifeTech
//
//  Created by Jonathon Albert on 19/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

class CodableStorage {

    private let storage: DiskStorage
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder

    init(
        storage: DiskStorage,
        decoder: JSONDecoder = .init(),
        encoder: JSONEncoder = .init()
    ) {
        self.storage = storage
        self.decoder = decoder
        self.encoder = encoder
    }

    func fetchAll<T: Decodable>(for prefix: String) throws -> [T] {
        let dataArray = try storage.fetchValues(with: prefix)
        let mappedArray = try dataArray.map({ try decoder.decode(T.self, from: $0) })
        return mappedArray
    }

    func fetch<T: Decodable>(for key: String) throws -> T {
        let data = try storage.fetchValue(for: key)
        return try decoder.decode(T.self, from: data)
    }

    func save<T: Encodable>(_ value: T, for key: String) throws {
        let data = try encoder.encode(value)
        try storage.save(value: data, for: key)
    }

    func delete(key: String) {
        storage.deleteValue(for: key)
    }
}
