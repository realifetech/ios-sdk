//
//  ScreenProvidable.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol ScreenProvidable {

    func getScreenTitle(
        for screenType: ScreenType,
        currentLanguageCode: String,
        callback: @escaping (Result<String, Error>) -> Void)

    func getScreenTitle(
        for screenId: String,
        currentLanguageCode: String,
        callback: @escaping (Result<String, Error>) -> Void)
}
