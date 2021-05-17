//
//  ConfigurationStore.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

protocol ConfigurationStorable {
    func set(_: RealifeTechConfigurationKey, value: Any)
    func get(_: RealifeTechConfigurationKey) -> Any?
}

// Another option here: We have a large struct containing all our config items, that can be a Bool/String/Float type
// Each config item can be mutated, so we can expose a setter in the form of ConfigStruct.someTypedValue.setNewValue
class ConfigurationStore: ConfigurationStorable {
    var storedConfigurations = Set<RealifeTechConfiguration>()

    func set(_ key: RealifeTechConfigurationKey, value: Any) {
        guard let configuration = RealifeTechConfiguration(key: key, value: value) else { return }
        storedConfigurations.update(with: configuration)
    }

    func get(_ key: RealifeTechConfigurationKey) -> Any? {
         return storedConfigurations.first(where: { $0.key == key })?.value
    }
}
