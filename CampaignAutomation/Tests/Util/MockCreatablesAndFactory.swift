//
//  MockCreatablesAndFactory.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2022/6/10.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation

struct MockBannerCreatable: RLTCreatable {
    let title: String
    let linkEvent: (() -> Void)?
}

final class MockBannerFactory: RLTBannerFactory {
    var urlOpened: URL?
    func create(from dataModel: RLTBanner) -> RLTCreatable? {
        let openHandler: (URL) -> Void = { url in
            self.urlOpened = url
        }
        return MockBannerCreatable(title: dataModel.title ?? "",
                                   linkEvent: dataModel.generateLinkHandler(openHandler: openHandler))
    }
}
