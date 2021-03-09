//
//  ContentFactory.swift
//  RealifeTech-SDK
//
//  Created by Mickey Lee on 03/03/2021.
//

import Foundation
import RealifeTech_CoreSDK

public enum ContentFactory {

    public static func makeContentModule(graphQLDispatcher: GraphQLDispatching) -> Content {
        return ContentImplementing(dispatcher: graphQLDispatcher)
    }
}
