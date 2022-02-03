//
//  AnalyticsFactory.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public enum AnalyticsFactory {

    static func makeAnalyticsModule(
        graphQLManager: GraphQLManageable,
        reachabilityHelper: ReachabilityChecking,
        deviceRegistering: DeviceRegistering,
        identityPersister: IdentityPersisting
    ) -> Analytics {
        let queue = PersistentQueue<AnalyticEventAndCompletion>(name: "analyticsEvent")
        let analyticsLogger = AnalyticsLogger(
            graphQLManager: graphQLManager,
            reachabilityHelper: reachabilityHelper,
            persistentQueue: AnyQueue(queue),
            deviceRegistering: deviceRegistering,
            identityPersister: identityPersister)
        return AnalyticsImplementing(analyticsLogger: analyticsLogger)
    }
}
