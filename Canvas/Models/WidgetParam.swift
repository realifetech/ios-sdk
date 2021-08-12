//
//  WidgetParam.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct WidgetParam: Codable, Equatable {

    public let key: String?
    public let value: String?

    public init(key: String?, value: String?) {
        self.key = key
        self.value = value
    }
}
