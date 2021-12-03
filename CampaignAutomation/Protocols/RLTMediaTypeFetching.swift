//
//  RLTMediaTypeFetching.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

protocol RLTMediaTypeFetching {
    associatedtype MediaType
    var factories: [RLTContentType: RLTCreatableFactory] { get set }
}

extension RLTMediaTypeFetching {
    func fetch(location: String, completion: (Result<[MediaType], Error>) -> Void) {
//        RealifeTechSDK.shared.generateCreatables(for: location, factories: factories) { result in
//            switch result {
//            case .success(let creatables):
//                let unwrappedCreatables = creatables.map { $0 as? MediaType }.compactMap { $0 }
//                completion(.success(unwrappedCreatables))
//            case .failure(let error): completion(.failure(error))
//            }
//        } TODO
    }
}
