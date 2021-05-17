//
//  ViewProviding.swift
//  RealifeTech
//
//  Created by Olivier Butler on 11/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

public protocol ViewProviding {
    func makeSomeView(frame: CGRect) -> UIView?
}
