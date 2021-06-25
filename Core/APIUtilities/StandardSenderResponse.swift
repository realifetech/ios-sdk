//
//  StandardSenderResponse.swift
//  CLArena
//
//  Created by Ross Patman on 21/02/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation

public struct StandardSenderResponse: Codable {
    public let code: Int?
    public let type: String?
    public let message: String?
}

extension StandardSenderResponse {
    public var isSuccess: Bool { return code == 200 }
}
