//
//  CreatablesView.swift
//  SampleApp
//
//  Created by Ross Patman Work on 06/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI
import RealifeTech

struct CreatablesView: View {

    @EnvironmentObject private var errorHandler: ErrorHandler
    @ObservedObject private var viewModel = CreatableViewModel()

    var body: some View {
        HStack(spacing: 16) {
            Spacer()
            TextField("location", text: $viewModel.location)
                .roundedBorderTextField()
            VStack {
                // Use case 1: Use viewFatcher to auto generate view after data comes back
                Button("CALL (Creatables)") {
                    fetchCreatables()
                }
                // Use case 2: Fetch data without view fetcher
                Button("CALL (Data)") {
                    fetchData()
                }
            }
            Spacer()
        }
        ScrollView {
            VStack {
                ForEach(viewModel.views, id: \.id) { item in
                    item.creatables
                }
                Text(viewModel.error)
                    .background(Color.white)
                Spacer()
            }
        }
        .padding(16)
    }

    private func fetchCreatables() {
        do {
            try viewModel.fetchCreatables()
        } catch {
            errorHandler.handle(error: error)
        }
    }

    private func fetchData() {
        do {
            try viewModel.fetchData()
        } catch {
            errorHandler.handle(error: error)
        }
    }
}

struct GenericCreatableViews {
    let id = UUID()
    let creatables: AnyView
}

struct RealifeTechViewConverter {

    private let factories: [RLTContentType: RLTCreatableFactory]

    init(factories: [RLTContentType: RLTCreatableFactory]) {
        self.factories = factories
    }

    func convert(items: [RLTContentItem]) -> [GenericCreatableViews] {
        return RLTContentConverter().convert(factories: factories, items: items)
            .compactMap { $0 as? RLTViewCreatable }
            .compactMap { $0.unwrappedGenericView }
            .compactMap { GenericCreatableViews(creatables: $0) }
    }
}

final class CreatableViewModel: ObservableObject {

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
            case .failure(let error):
                self?.error = error.localizedDescription
            }
        }
    }
}

// You could create and use your own Fetcher instead of using our default:
protocol ExampleMediaType { }
extension BannerView: ExampleMediaType { }
class ExampleFetcher: RLTMediaTypeFetching {
    typealias MediaType = ExampleMediaType
    var factories: [RLTContentType: RLTCreatableFactory] = [.banner: BannerViewFactory()]
}
/*
 ExampleFetcher().fetch(location: "location-id") { result in in }
 (All results would be guaranteed to conform to ExampleMediaType)
*/
