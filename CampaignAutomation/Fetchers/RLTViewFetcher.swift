//
//  RLTViewFetcher.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

class RLTViewFetcher: RLTMediaTypeFetching {
    typealias MediaType = RLTViewCreatable
    static let shared = RLTViewFetcher()
    var factories: [RLTContentType: RLTCreatableFactory] = [:]
}
