//
//  JavascriptRunDetails.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 24/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct JavascriptRunDetails {
    let javascript: String
    let reloadOnSuccess: Bool
    var completion: ((Any?, Error?) -> Void)?
}
