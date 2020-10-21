//
//  Storage.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

typealias Handler<T> = (Result<T, Error>) -> Void
typealias Storage = ReadableStorage & WritableStorage

protocol ReadableStorage {
    func fetchValues(with prefix: String) throws -> [Data]
    func fetchValue(for key: String) throws -> Data
    func fetchValue(for key: String, handler: @escaping Handler<Data>)
}

protocol WritableStorage {
    func save(value: Data, for key: String) throws
    func save(value: Data, for key: String, handler: @escaping Handler<Data>)
    func deleteValue(for key: String)
}

enum StorageType: String {
    case loggingEvent
}

enum StorageError: Error {
    case notFound
    case cantWrite(Error)
}
