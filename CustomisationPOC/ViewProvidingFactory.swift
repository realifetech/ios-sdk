//
//  ViewProvidingFactory.swift
//  RealifeTech
//
//  Created by Olivier Butler on 11/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

enum ViewProvidingFactory {

    static func makeViewProvider(with uiConfig: SDKUIConfiguration) -> ViewProviding {
        return ViewProvider(uiConfiguration: uiConfig)
    }
}
