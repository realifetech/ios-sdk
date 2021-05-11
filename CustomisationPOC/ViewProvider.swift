//
//  ViewProvider.swift
//  RealifeTech
//
//  Created by Olivier Butler on 11/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

public final class ViewProvider: ViewProviding {

    private let uiConfiguration: SDKUIConfiguration

    init(uiConfiguration: SDKUIConfiguration) {
        self.uiConfiguration = uiConfiguration
    }

    public func makeSomeView(frame: CGRect) -> UIView {
        SomeView.init(frame: frame)
    }
}
