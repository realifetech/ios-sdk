//
//  AnalyticsLoggerTests.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class AnalyticsLoggerTests: XCTestCase {

    func test_init_emptyStorageDoesNothing() {}

    func test_init_getsItemsFromStorage() {}

    func test_logEvent_sendsSingleItem() {}

    func test_logEvent_delaysSingleItemUntilConnected() {}

    func test_logEvent_addsItemsToQueue() {}

    func test_logEvent_removesFromQueueWhenDone() {}

    func test_logEvent_leavesInQueueOnFailure() {}

    func test_logEvent_willContinueWhenGivenMoreItems() {

    }
}
