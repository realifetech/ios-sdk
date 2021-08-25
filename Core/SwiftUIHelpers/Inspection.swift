//
//  Inspection.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Combine
import SwiftUI

final class Inspection<V> {

    let notice = PassthroughSubject<UInt, Never>()
    var callbacks: [UInt: (V) -> Void] = [:]

    func visit(_ view: V, _ line: UInt) {
        guard let callback = callbacks.removeValue(forKey: line) else { return }
        callback(view)
    }
}
