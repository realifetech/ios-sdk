//
//  AnalyticsLogging.swift
//  Analytics
//
//  Created by Jonathon Albert on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public protocol AnalyticsLogging {
    func track(_ event: AnalyticEvent, completion: @escaping (Result<Bool, Error>) -> Void)
}
