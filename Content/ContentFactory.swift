//
//  ContentFactory.swift
//  RealifeTech-SDK
//
//  Created by Mickey Lee on 03/03/2021.
//

import Foundation

public enum ContentFactory {

    public static func makeContentModule(graphQLManager: GraphQLManageable) -> Content {
        return ContentImplementing(graphQLManager: graphQLManager)
    }
}
