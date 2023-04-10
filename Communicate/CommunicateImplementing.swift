//
//  CommunicateImplementing.swift
//  Communicate
//
//  Created by Olivier Butler on 12/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift
import GraphQL

public final class CommunicateImplementing: Communicate {

    let pushNotificationRegistrar: PushNotificationRegistering
    let analytics: Analytics
    private let graphQLManager: GraphQLManageable

    init(pushNotificationRegistrar: PushNotificationRegistering,
         analytics: Analytics,
         graphQLManager: GraphQLManageable) {
        self.pushNotificationRegistrar = pushNotificationRegistrar
        self.analytics = analytics
        self.graphQLManager = graphQLManager
    }

    public func trackPush(
        event: PushEvent,
        trackInfo: [String: Any],
        completion: @escaping (Result<Bool, Error>) -> Void
    ) {
        let new = extractTrackInfo(with: trackInfo)
        let event = AnalyticEvent(type: "user", action: event.rawValue, new: new, old: nil, version: "1.0")
        analytics.track(event, completion: completion)
    }

    private func extractTrackInfo(with trackInfo: [String: Any]) -> [String: Any]? {
        guard let custom = trackInfo["custom"] as? [String: Any], let track = custom["track"] as? [String: Any] else {
            return nil
        }
        return track
    }

    public func getNotificationConsents(completion: @escaping (Result<[NotificationConsent], Error>) -> Void) {
        let activeStatus = ApolloType.NotificationConsentFilter(status: .active)
        graphQLManager.dispatch(
            query: ApolloType.GetNotificationConsentsQuery(filter: activeStatus),
            cachePolicy: .returnCacheDataAndFetch) { result in
                switch result {
                case .success(let response):
                    guard let data = response.data else {
                        return completion(.failure(GraphQLManagerError.noDataError))
                    }
                    let notificationConsents = data.getNotificationConsents?.compactMap {
                        NotificationConsent(response: $0?.fragments.notificationConsentFragment)
                    } ?? []
                    completion(.success(notificationConsents))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    public func getMyNotificationConsents(completion: @escaping (Result<[DeviceNotificationConsent], Error>) -> Void) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyDeviceNotificationConsentsQuery(),
            cachePolicy: .returnCacheDataAndFetch) { result in
                switch result {
                case .success(let response):
                    guard let data = response.data else {
                        return completion(.failure(GraphQLManagerError.noDataError))
                    }
                    let deviceNotificationConsents: [DeviceNotificationConsent] =
                    data.getMyDeviceNotificationConsents?.compactMap {
                        guard let deviceConsent = $0,
                              let notificationConsent = NotificationConsent(
                                response: deviceConsent.consent.fragments.notificationConsentFragment)
                        else { return nil }
                        return DeviceNotificationConsent(
                            id: deviceConsent.id,
                            enabled: deviceConsent.enabled,
                            consent: notificationConsent)
                    } ?? []
                    completion(.success(deviceNotificationConsents))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    public func updateMyNotificationConsent(id: String,
                                            enabled: Bool,
                                            completion: @escaping (Result<Bool, Error>) -> Void) {
        let input = ApolloType.DeviceNotificationConsentInput(notificationConsentId: id, enabled: enabled)
        graphQLManager.dispatchMutation(
            mutation: ApolloType.UpdateMyDeviceNotificationConsentMutation(input: input),
            cacheResultToPersistence: false) { result in
                switch result {
                case .success(let response):
                    guard response.data != nil else {
                        return completion(.failure(GraphQLManagerError.noDataError))
                    }
                    completion(.success(true))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

extension CommunicateImplementing {

    public func registerForPushNotifications(token: String, completion: @escaping (Result<Void, Error>) -> Void) {
        pushNotificationRegistrar.registerForPushNotifications(token: token, completion: completion)
    }

    public func registerForPushNotifications(tokenData: Data, completion: @escaping (Result<Void, Error>) -> Void) {
        pushNotificationRegistrar.registerForPushNotifications(tokenData: tokenData, completion: completion)
    }
}
