//
//  OrderState.swift
//  RealifeTech
//
//  Created by Mickey Lee on 28/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct OrderState {

    public let status: String?
    public let workingState: String?
    public let translations: [StandardDescriptionTranslation]?

    init(response: ApolloType.FragmentOrder.State?) {
        status = response?.status
        workingState = response?.workingState
        translations = response?.translations?.compactMap {
            StandardDescriptionTranslation(
                language: $0?.language,
                title: $0?.title,
                description: $0?.description)
        }
    }
}
