//
//  FulfilmentPointProvidable.swift
//  RealifeTech
//
//  Created by Mickey Lee on 21/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol FulfilmentPointProvidable {
    func getFulfilmentPointCategories(
        pageSize: Int,
        page: Int,
        callback: @escaping (Result<PaginatedObject<FulfilmentPointCategory>, Error>) -> Void)
    func getFulfilmentPointCategoryById(
        id: String,
        callback: @escaping (Result<FulfilmentPointCategory, Error>) -> Void)
}
