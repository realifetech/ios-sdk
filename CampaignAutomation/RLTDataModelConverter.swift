//
//  RLTDataModelConverter.swift
//  RealifeTech-SDK
//
//  Created by YOU-HSUAN YU on 2022/5/26.
//

import Foundation

/*
 To convert the generic type (RLTDataModel) to concrete type.
Ex: .banner -> RLTBanner
    .button -> RLTButton
 */
public struct RLTDataModelConverter {

    // When there's new ContentType, we need to add new case in this enum and it's corresponding concrete dataType
    public enum ContentTypeDataModel {
        case banner(RLTBanner)
    }

    public init() { }

    public func convertToContentTypeDataModels(_ items: [RLTItem]) -> [ContentTypeDataModel] {
        var results: [ContentTypeDataModel] = []
        items.forEach {
            if $0.contentType == .banner, let bannerDataModel = $0.dataModel as? RLTBanner {
                results.append(.banner(bannerDataModel))
            }
        }
        return results
    }
}
