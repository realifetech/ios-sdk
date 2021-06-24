//
//  ProductImage.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct ProductImage: Codable, Equatable {

    public let imageUrl: String?
    public let position: Int?

    init(response: ApolloType.FragmentProduct.Image?) {
        imageUrl = response?.imageUrl
        position = response?.position
    }
}
