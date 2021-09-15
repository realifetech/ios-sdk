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

extension SeatInfo {

    /// For GraphQL JSON type, when the response has no data for SeatInfo, we get `[]`, so we initialise SeatInfo with nil for this case.
    /// On the other hand, if there's data for SeatInfo, we get [["row": "a", "seat": "b"]], we can initialise SeatInfo(row: "a", seat: "b")
    init?(json: JSON?) throws {
        guard let json = json, json.isEmpty else {
            return nil
        }
        try? self.init(jsonValue: json)
    }

    init?(jsonValue value: JSON) throws {
        if let dic = value.first as? [String: String?] {
            let decoder = JSONDecoder()
            let data = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            do {
                self = try decoder.decode(SeatInfo.self, from: data)
            } catch {
                throw JSONDecodingError.couldNotConvert(value: value, to: SeatInfo.self)
            }
        }
        return nil
    }
}
