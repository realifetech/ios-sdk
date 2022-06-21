//
//  RLTContentConverterTests.swift
//  RealifeTechTests
//
//  Created by YOU-HSUAN YU on 2022/6/10.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class RLTContentConverterTests: XCTestCase {

    private var sut: RLTContentConverter!

    override func setUp() {
        super.setUp()
        sut = RLTContentConverter()
    }

    func test_convert_bannerContentItemToBannerCreatable() {
        let mockFactory: [RLTContentType: RLTCreatableFactory] = [.banner: MockBannerFactory()]
        let contentItems = createContentItems()
        let creables = sut.convert(factories: mockFactory, items: contentItems)
        let bannerContents = contentItems.filter { $0.contentType == .banner }
        XCTAssertEqual(creables.count, bannerContents.count)
        creables.forEach {
            XCTAssertTrue($0 is MockBannerCreatable)
        }
    }

    private func createContentItems() -> [RLTContentItem] {
        let responseItems = [
            CAGetContentResponseItem(campaignId: "1", contentType: "banner", data: ["title": "Banner title",
                                                                         "subtitle": "Banner subtitle",
                                                                         "url": "https://google.com"]),
            CAGetContentResponseItem(campaignId: "1", contentType: "button", data: ["title": "Button title"]),
            CAGetContentResponseItem(campaignId: "1", contentType: "banner", data: ["title": "Banner title 2",
                                                                         "subtitle": "Banner subtitle 2",
                                                                         "url": "https://google.com/2"])
        ]
        return responseItems.compactMap {
            guard let data = $0.unwrappedDataModel else { return nil }
            return RLTContentItem(contentType: $0.unwrappedContentType, data: data) }
    }
}
