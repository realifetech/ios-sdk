//
//  FulfilmentPointCategoryTranslation.swift
//  RealifeTech
//
//  Created by Mickey Lee on 21/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct FulfilmentPointCategoryTranslation: Codable, Equatable {

    let language: String?
    let title: String?

    init(response: ApolloType.FragmentFulfilmentPointCategory.Translation?) {
        language = response?.language?.rawValue
        title = response?.title
    }
}
