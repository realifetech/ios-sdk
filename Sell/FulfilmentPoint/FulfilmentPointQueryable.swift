//
//  FulfilmentPointQueryable.swift
//  RealifeTech
//
//  Created by Olivier Butler on 11/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol FulfilmentPointQueryable {
    func getFulfilmentPoints(
        pageSize: Int,
        page: Int,
        filters: FulfilmentPointFilter,
        completion: @escaping (Result<PaginatedObject<FulfilmentPoint>, Error>) -> Void)

    func getFulfilmentPointById(
        id: String,
        completion: @escaping (Result<FulfilmentPoint, Error>) -> Void)

    func getFulfilmentPointCategories(
        pageSize: Int,
        page: Int,
        callback: @escaping (Result<PaginatedObject<FulfilmentPointCategory>, Error>) -> Void)

    func getFulfimentPointCategoryById(
        id: String,
        completion: @escaping (Result<FulfilmentPointCategory, Error>) -> Void)
}

// These protocols should be replaced some kind of model object, this could just wrap around the GraphQL object
public protocol FulfilmentPoint {}
public protocol FulfilmentPointFilter {}
public protocol FulfilmentPointCategory {}
