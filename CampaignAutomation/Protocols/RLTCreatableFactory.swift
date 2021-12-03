//
//  RLTCreatableFactory.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

protocol RLTCreatableFactory {
    func create(from dataModel: RLTDataModel) -> RLTCreatable?
}
