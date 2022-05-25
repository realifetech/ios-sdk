//
//  CreatablesExampleViewModel.swift
//  SampleApp
//
//  Created by YOU-HSUAN YU on 2022/5/25.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import RealifeTech

protocol CreatablesExampleDelegate: AnyObject {
    func didLoadData()
}

class CreatablesExampleViewModel: RLTContentTypeDataModelFetching {

    weak var delegate: CreatablesExampleDelegate?
    var dataModels: [RLTDataModelConverter.ContentTypeDataModel]?
    var banners: [RLTBanner]?

    // Integrators can use `RLTDataModelConverter` to get concrete dataModel type
    func fetchCADataModels(with location: String = "homepage-top-view") {
        fetchRLTDataModels(location: location) { [weak self] result in
            switch result {
            case .success(let items):
                // Converter tool: RLTDataModelConverter
                self?.dataModels = RLTDataModelConverter().convertToContentTypeDataModels(items)
                self?.delegate?.didLoadData()
            case.failure(let error):
                print(error)
            }
        }
    }

    // Use case: If integrators only wants to get banner type, they can use `fetchRLTContentTypeDataModels` function
    func fetchBannerDataModels(with location: String = "homepage-top-view") {
        fetchRLTContentTypeDataModels(location: location) { [weak self] result in
            switch result {
            case .success(let contentTypeDataModels):
                contentTypeDataModels.forEach {
                    switch $0 {
                    case .banner(let bannerDataType):
                        self?.banners?.append(bannerDataType)
                    }
                }
                self?.delegate?.didLoadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
