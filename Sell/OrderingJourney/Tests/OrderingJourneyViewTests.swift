//
//  OrderingJourneyViewTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 19/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import SwiftUI
import Combine
import ViewInspector
@testable import RealifeTech

final class OrderingJourneyViewTests: XCTestCase {

    private var sut: OrderingJourneyView!
    private var scheduler: DispatchQueueTestScheduler!
    private var bag = Set<AnyCancellable>()
    private let urlString = "https://www.google.com"

    override func setUp() {
        super.setUp()
        scheduler = DispatchQueueTestScheduler()
        sut = OrderingJourneyView(
            urlString: urlString,
            colorStore: EmptyColorStore(),
            scheduler: scheduler.eraseToAnyScheduler())
    }

    override func tearDown() {
        sut = nil
        scheduler = nil
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

    func test_goBackButtonTapped_webViewNavigationPublisherReceivesValue() throws {
        let expectation1 = sut.inspection.inspect { [self] view in
            let backwardButton = try getBottomViewFromInsepctedView(view).vStack().hStack(0).button(0)
            XCTAssertTrue(backwardButton.isDisabled())
            XCTAssertEqual(try backwardButton.foregroundColor(), sut.colorStore.getColor(for: .neutral))
            sut.store.canGoBack.send(true)
        }
        let expectation2 = sut.inspection.inspect(onReceive: sut.store.canGoBack) { [self] view in
            let backwardButton = try getBottomViewFromInsepctedView(view).vStack().hStack(0).button(0)
            XCTAssertFalse(backwardButton.isDisabled())
            XCTAssertEqual(try backwardButton.foregroundColor(), sut.colorStore.getColor(for: .onSurface))
            try backwardButton.tap()
        }
        let expectation3 = XCTestExpectation(description: "final")
        sut.store.webViewNavigationPublisher
            .sink { receivedNavigation in
                XCTAssertEqual(receivedNavigation, .backward)
                expectation3.fulfill()
            }.store(in: &bag)
        ViewHosting.host(view: sut)
        wait(for: [expectation1, expectation2, expectation3], timeout: 1)
    }

    func test_goForwardButtonTapped_webViewNavigationPublisherReceivesValue() throws {
        let expectation1 = sut.inspection.inspect { [self] view in
            let forwardButton = try getBottomViewFromInsepctedView(view).vStack().hStack(0).button(1)
            XCTAssertTrue(forwardButton.isDisabled())
            XCTAssertEqual(try forwardButton.foregroundColor(), sut.colorStore.getColor(for: .neutral))
            sut.store.canGoForward.send(true)
        }
        let expectation2 = sut.inspection.inspect(onReceive: sut.store.canGoForward) { [self] view in
            let forwardButton = try getBottomViewFromInsepctedView(view).vStack().hStack(0).button(1)
            XCTAssertFalse(forwardButton.isDisabled())
            XCTAssertEqual(try forwardButton.foregroundColor(), sut.colorStore.getColor(for: .onSurface))
            try forwardButton.tap()
        }
        let expectation3 = XCTestExpectation(description: "final")
        sut.store.webViewNavigationPublisher
            .sink { receivedNavigation in
                XCTAssertEqual(receivedNavigation, .forward)
                expectation3.fulfill()
            }.store(in: &bag)
        ViewHosting.host(view: sut)
        wait(for: [expectation1, expectation2, expectation3], timeout: 1)
    }

    private func getBottomViewFromInsepctedView(
        _ view: InspectableView<ViewType.View<OrderingJourneyView>>
    ) throws -> InspectableView<ViewType.AnyView> {
        let navigationView = try view.navigationView()
            .navigationBarItems(VStack<TupleView<(WebViewWrapper, AnyView)>>.self)
        let vStack = try navigationView.vStack(0)
        return try vStack.anyView(1)
    }
}

extension Inspection: InspectionEmissary { }
extension OrderingJourneyView: Inspectable { }
