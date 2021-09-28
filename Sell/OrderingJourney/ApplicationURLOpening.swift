//
//  ApplicationURLOpening.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 24/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import UIKit

public protocol ApplicationURLOpening {
    func canOpenURL(_ url: URL) -> Bool
    func open(_ url: URL,
              options: [UIApplication.OpenExternalURLOptionsKey: Any],
              completionHandler completion: ((Bool) -> Void)?)
}
