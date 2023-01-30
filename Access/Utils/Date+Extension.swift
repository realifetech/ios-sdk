//
//  Date+Extension.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/27.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation

extension Date {

    var startOfCurrentDay: Date {
        var calendar = NSCalendar.current
        calendar.timeZone = TimeZone(identifier: "UTC") ?? TimeZone.current
        return calendar.startOfDay(for: Date())
    }

    /// This computed variable returns a string representation of the date with the format
    /// 2020-09-09T01:00:00+01:00
    var twentyFourHourDateTimeStamp: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        return dateFormatter.string(from: self)
    }
}
