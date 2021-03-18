//
//  WebPageCreatable.swift
//  RealifeTech
//
//  Created by Mickey Lee on 02/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

public protocol WebPageCreatable {
    func getWebPage(
        forType type: WebPage.`Type`,
        completion: @escaping (Result<WebPage, Error>) -> Void)
}
