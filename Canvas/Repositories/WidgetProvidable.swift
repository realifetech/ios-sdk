//
//  CanvasProvidable.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol WidgetProvidable {

    func getWidgets(
        for screenType: ScreenType,
        pageSize: Int,
        page: Int?,
        callback: @escaping (Result<PaginatedObject<Widget>, Error>) -> Void)

    func getWidgets(
        for screenId: String,
        pageSize: Int,
        page: Int?,
        callback: @escaping (Result<PaginatedObject<Widget>, Error>) -> Void)
}
