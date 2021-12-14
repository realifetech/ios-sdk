//
//  RLTBannerFactoryTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 09/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class RLTBannerFactoryTests: XCTestCase {

    func test_genericFactories_concreteCreateCalled() {
        let sut1 = MockBannerFactory()
        let sut2 = MockBannerFactory()
        let factories: [RLTCreatableFactory] = [sut1, sut2]
        let dataModel = RLTBanner(id: 123,
                                  title: nil,
                                  subtitle: "aaa",
                                  imageUrl: nil,
                                  language: nil,
                                  url: nil,
                                  linkAnalyticsEvent: nil)
        for factory in factories {
            _ = factory.create(from: dataModel)
        }
        XCTAssert(sut1.passedDataModel?.id == 123)
        XCTAssert(sut2.passedDataModel?.subtitle == "aaa")
    }
}

private class MockBannerFactory: RLTBannerFactory {
    var passedDataModel: RLTBanner?
    func create(from dataModel: RLTBanner) -> RLTCreatable? {
        passedDataModel = dataModel
        return nil
    }
}
