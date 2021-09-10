//
//  SeatInfo.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo
#if !COCOAPODS
import GraphQL
#endif

public struct SeatInfo: Codable, Equatable {

    public let row: String?
    public let seat: String?
    public let block: String?
    public let table: String?

    public init(
        row: String?,
        seat: String?,
        block: String?,
        table: String?
    ) {
        self.row = row
        self.seat = seat
        self.block = block
        self.table = table
    }
}

extension SeatInfo: JSONDecodable {

    public init?(json: JSON?) throws {
        try? self.init(jsonValue: json.jsonValue)
    }

    public init(jsonValue value: JSONValue) throws {
        guard let dictionary = value as? [String: String] else {
            throw JSONDecodingError.couldNotConvert(value: value, to: SeatInfo.self)
        }
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        let decoder = JSONDecoder()
        do {
            self = try decoder.decode(SeatInfo.self, from: data)
        } catch {
            throw JSONDecodingError.couldNotConvert(value: value, to: SeatInfo.self)
        }
    }

    public func mapToApolloJSON() -> JSON? {
        return ["row": self.row,
                "seat": self.seat,
                "block": self.block,
                "table": self.table]
    }
}
