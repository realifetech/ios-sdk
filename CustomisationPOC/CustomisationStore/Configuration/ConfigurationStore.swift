//
//  ConfigurationStore.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

protocol ConfigurationStorable {
    func set(_: RLTConfigurationBoolKey, value: Bool)
    func get(_: RLTConfigurationBoolKey) -> Bool?
    func set(_: RLTConfigurationFloatKey, value: Float)
    func get(_: RLTConfigurationFloatKey) -> Float?
}

// Another option here: We have a large struct containing all our config items, that can be a Bool/String/Float type
// Each config item can be mutated, so we can expose a setter in the form of ConfigStruct.someTypedValue.setNewValue
class ConfigurationStore: ConfigurationStorable {
    private var storedBools = [RLTConfigurationBoolKey: Bool]()
    private var storedFloats = [RLTConfigurationFloatKey: Float]()

    func set(_ key: RLTConfigurationBoolKey, value: Bool) {
        storedBools[key] = value
    }

    func get(_ key: RLTConfigurationBoolKey) -> Bool? {
        return storedBools[key]
    }

    func set(_ key: RLTConfigurationFloatKey, value: Float) {
        storedFloats[key] = value
    }

    func get(_ key: RLTConfigurationFloatKey) -> Float? {
        return storedFloats[key]
    }
}
