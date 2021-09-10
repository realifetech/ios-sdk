//
//  JSON+Helper.swift
//  GraphQL
//
//  Created by YOU-HSUAN YU on 2021/9/7.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo

public typealias JSON = [Any]

extension Array: JSONDecodable {

    public init(jsonValue value: JSONValue) throws {
        guard let array = value as? Array else {
          throw JSONDecodingError.couldNotConvert(value: value, to: Array.self)
        }
        self = array
    }
}
