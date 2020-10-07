//
//  Dictionary+Extensions.swift
//  APIUtilities
//
//  Created by Olivier Butler on 28/09/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation

func dictionaryRemovingNilValuesFromDictionary(_ sourceDictionary: [String: AnyObject?]) -> [String: AnyObject] {
    var result = [String: AnyObject]()
    for (key, value) in sourceDictionary {
        if let value = value {
            result[key] = value
        }
    }
    return result
}
