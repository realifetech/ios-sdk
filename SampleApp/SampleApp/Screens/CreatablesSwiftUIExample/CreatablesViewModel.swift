//
//  CreatablesViewModel.swift
//  SampleApp
//
//  Created by YOU-HSUAN YU on 2022/6/20.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import SwiftUI
import RealifeTech

struct GenericCreatableViews {
    let id = UUID()
    let creatables: AnyView
}

struct RealifeTechViewConverter {

    private let factories: [RLTContentType: RLTCreatableFactory]

    init(factories: [RLTContentType: RLTCreatableFactory]) {
        self.factories = factories
    }

    func convert(items: [RLTContentItem]) -> [RLTViewCreatable] {
        return RLTContentConverter().convert(factories: factories, items: items)
            .compactMap { $0 as? RLTViewCreatable }
    }
}

final class CreatablesViewModel: ObservableObject {

    @Published var location: String = "homepage-top-view"
    @Published var error: String = ""
    @Published var views: [GenericCreatableViews] = []
    private let factories: [RLTContentType: RLTCreatableFactory] = [.banner: BannerViewFactory()]

    private var viewFetcher: RLTViewFetcher? {
        let viewFetcher = RealifeTech.CampaignAutomation?.viewFetcher
        viewFetcher?.factories = factories
        return viewFetcher
    }

    func fetchCreatables() throws {
        guard let viewFetcher = viewFetcher else {
            throw StandardError.deviceNotRegistered
        }
        viewFetcher.fetch(location: location) { [weak self] result in
            switch result {
            case .success(let fetchedCreatables):
                self?.views = fetchedCreatables
                    .compactMap { $0.unwrappedGenericView }
                    .compactMap { GenericCreatableViews(creatables: $0) }
                // if this were a ViewController, you could use RLTViewCreatable.embed(...)
            case .failure(let error):
                self?.error = error.localizedDescription
            }
        }
    }

    func fetchData() throws {
        guard let campaignAutomation = RealifeTech.CampaignAutomation else {
            throw StandardError.deviceNotRegistered
        }
        campaignAutomation.fetchData(for: location) { [weak self] result in
            switch result {
            case .success(let items):
                guard let self = self else { return }
                self.views = RealifeTechViewConverter(factories: self.factories).convert(items: items)
                    .compactMap { $0.unwrappedGenericView }
                    .compactMap { GenericCreatableViews(creatables: $0) }
            case .failure(let error):
                self?.error = error.localizedDescription
            }
        }
    }
}
