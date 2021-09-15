//
//  String+GraphQLDate.swift
//  RealifeTech
//
//  Created by Mickey Lee on 25/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

extension String {

    var iso8601Date: Date? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: self)
    }
}

extension Date {

    var iso8601String: String? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.string(from: self)
    }

    var apiParameterDateFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
