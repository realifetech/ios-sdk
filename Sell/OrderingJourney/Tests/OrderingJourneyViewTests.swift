//
//  OrderingJourneyViewTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 19/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import RealifeTech

final class OrderingJourneyViewTests: XCTestCase {

    private var sut: OrderingJourneyView!
    private let urlString = "https://www.google.com"

    override func setUp() {
        super.setUp()
        sut = OrderingJourneyView(urlString: urlString, colorStore: EmptyColorStore())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    private func getNavigationViewHierachy() throws -> InspectableView<ViewType.ClassifiedView> {
        let navigationView = try sut.body.inspect().navigationView()
        typealias NavigationBarWrapped = VStack<TupleView<(WebViewWrapper, AnyView)>>
        return try navigationView.navigationBarItems(NavigationBarWrapped.self)
    }

    func test_renderBottomView_canGoBackAndCanGoForwardAreFalse_buttonsAreDisabled() throws {
        let vStack = try getNavigationViewHierachy().vStack(0)
        let bottomView = try vStack.anyView(1)
        let backwardButton = try bottomView.vStack().hStack(0).button(0)
        XCTAssertTrue(backwardButton.isDisabled())
        let forwardButton = try bottomView.vStack().hStack(0).button(1)
        XCTAssertTrue(forwardButton.isDisabled())
    }
}
