//
//  SeatInfo.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

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

    init(response: ApolloType.FragmentSeatInfo?) {
        row = response?.row
        seat = response?.seat
        block = response?.block
        table = response?.table
    }
}
