//
//  RLTViewFetcher.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

public class RLTViewFetcher: RLTMediaTypeFetching {
    public typealias MediaType = RLTViewCreatable
    public var factories: [RLTContentType: RLTCreatableFactory] = [:]
    public init() {}
}
