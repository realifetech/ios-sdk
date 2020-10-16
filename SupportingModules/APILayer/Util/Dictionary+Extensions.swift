//
//  DictionaryExtensions.swift
//  ConcertLiveCore
//
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

extension Dictionary {

    ///Creates a Dictionary with keys and values generated by running each [key: value] of self through the mapFunction.
    /// - Parameter mapFunction: Function to use to transform existing key/value
    /// - Returns: Mapped dictionary
    public func map <K, V> (_ map: (Key, Value) -> (K, V)) -> [K: V] {
        var mapped = [K: V]()
        for (key, value) in self {
            let (_key, _value) = map(key, value)
            mapped[_key] = _value
        }
        return mapped
    }
}

func dictionaryRemovingNilValuesFromDictionary(_ sourceDictionary: [String: AnyObject?]) -> [String: AnyObject] {
    var result: [String: AnyObject] = [:]
    for (key, value) in sourceDictionary {
        if let value = value {
            result[key] = value
        }
    }
    return result
}
