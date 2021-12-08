//
//  RLTBannerFactory.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

public protocol RLTBannerFactory: RLTCreatableFactory {
    func create(from dataModel: RLTBanner) -> RLTCreatable?
}

public extension RLTBannerFactory {
    func create(from dataModel: RLTDataModel) -> RLTCreatable? {
        guard let dataModel = dataModel as? RLTBanner else { return nil }
        return create(from: dataModel)
    }
}