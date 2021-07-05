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

    public init(imageUrl: String?, position: Int?) {
        self.imageUrl = imageUrl
        self.position = position
    }
}

extension ProductImage {

    init(response: ApolloType.FragmentProduct.Image?) {
        imageUrl = response?.imageUrl
        position = response?.position
    }
}
