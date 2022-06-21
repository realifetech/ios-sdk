//
//  CreatablesExampleViewModel.swift
//  SampleApp
//
//  Created by YOU-HSUAN YU on 2022/5/25.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import RealifeTech

protocol CreatablesExampleDelegate: AnyObject {
    func didFetch(creatables: [RLTViewCreatable])
}

class CreatablesExampleViewModel {

    weak var delegate: CreatablesExampleDelegate?
    private let factories: [RLTContentType: RLTCreatableFactory] = [.banner: BannerViewFactory()]

    func fetchData(location: String = "homepage-top-view") throws {
        guard let campaignAutomation = RealifeTech.CampaignAutomation else {
            throw StandardError.deviceNotRegistered
        }
        campaignAutomation.fetchData(for: location) { [weak self] result in
            switch result {
            case .success(let items):
                guard let self = self else { return }
                let creatables = RealifeTechViewConverter(factories: self.factories).convert(items: items)
                self.delegate?.didFetch(creatables: creatables)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
