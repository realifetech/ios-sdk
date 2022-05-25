//
//  RLTContentTypeDataModelFetching.swift
//  RealifeTech-SDK
//
//  Created by YOU-HSUAN YU on 2022/5/26.
//

import Foundation

public protocol RLTContentTypeDataModelFetching {
    func fetchRLTDataModels(location: String, completion: @escaping (Result<[RLTItem], Error>) -> Void)
    func fetchRLTContentTypeDataModels(location: String, completion: @escaping (Result<[RLTDataModelConverter.ContentTypeDataModel], Error>) -> Void)
}

public extension RLTContentTypeDataModelFetching {

    func fetchRLTDataModels(location: String, completion: @escaping (Result<[RLTItem], Error>) -> Void) {
        RealifeTech.CampaignAutomation.fetchRLTDataModels(for: location, completion: completion)
    }

    func fetchRLTContentTypeDataModels(location: String, completion: @escaping (Result<[RLTDataModelConverter.ContentTypeDataModel], Error>) -> Void) {
        RealifeTech.CampaignAutomation.fetchRLTDataModels(for: location) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let items):
                let contentTypeDataModels = RLTDataModelConverter().convertToContentTypeDataModels(items)
                completion(.success(contentTypeDataModels))
            }
        }
    }
}
