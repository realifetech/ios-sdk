//
//  SeatInfo.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
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

    // For GraphQL JSON type, when the response has no data for SeatInfo, we get `[]`,
    // so we initialise SeatInfo with nil for this case.
    // On the other hand, if there's data for SeatInfo, we get [["row": "a", "seat": "b"]],
    // we can initialise SeatInfo(row: "a", seat: "b")
    init?(json: JSON?) {
        guard let json = json, !json.isEmpty else {
            return nil
        }
        self.init(jsonValue: json)
    }

    init?(jsonValue value: JSON) {
        guard
            let dic = value.first as? [String: String?],
            let data = try? JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted),
            let decoded = try? JSONDecoder().decode(SeatInfo.self, from: data)
        else {
            return nil
        }
        self = decoded
    }
}
