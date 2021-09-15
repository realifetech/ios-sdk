//
//  ColorTypeTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import SwiftUI
@testable import RealifeTech

final class ColorTypeTests: XCTestCase {

    func test_defaultColor() {
        let cases: [(ColorType, String)] = [
            (.primary, "FFFFFF"),
            (.onPrimary, "000000"),
            (.surface, "f7f7f7"),
            (.onSurface, "083C62"),
            (.neutral, "BDBBBB")
        ]
        cases.forEach {
            XCTAssertEqual(
                $0.0.default,
                Color(hex: $0.1))
        }
    }
}
