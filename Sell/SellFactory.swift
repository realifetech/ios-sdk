//
//  SellFactory.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum SellFactory {

    public static func makeSellModule(graphQLDispatcher: GraphQLDispatching) -> Content {
        return ContentImplementing(dispatcher: graphQLDispatcher)
    }
}
