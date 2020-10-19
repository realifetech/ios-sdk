//
//  AnalyticsLogging.swift
//  Analytics
//
//  Created by Jonathon Albert on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

protocol AnalyticsLogging {
    func logEvent(_ event: LoggingEvent, completion: @escaping (Result<Void, Error>) -> Void)
}
