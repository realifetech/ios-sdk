//
//  CanvasFactory.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum CanvasFactory {

    static func makeCanvasModule(graphQLManager: GraphQLManageable) -> Canvas {
        CanvasRepository(graphQLManager: graphQLManager)
    }
}
