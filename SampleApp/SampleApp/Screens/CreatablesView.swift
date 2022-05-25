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
        ScrollView {
            HStack {
                TextField("location", text: $viewModel.location)
                    .roundedBorderTextField()
                Button("CALL") {
                    fetchCreatables()
                }
            }
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
            try viewModel.fetchDataModelsAndApplyToViews()
        } catch {
            errorHandler.handle(error: error)
        }
    }
}

struct GenericCreatableViews {
    let id = UUID()
    let creatables: AnyView
}

final class CreatableViewModel: ObservableObject {

    @Published var location: String = "homepage-top-view"
    @Published var error: String = ""
    @Published var views: [GenericCreatableViews] = []

    private var viewFetcher: RLTViewFetcher? {
        let viewFetcher = RealifeTech.CampaignAutomation?.viewFetcher
        viewFetcher?.factories = [.banner: BannerViewFactory()]
        return viewFetcher
    }
    // Use case 1: when integrators create RLTCreatable via viewFatcher factory
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
}

// Use case 2: Integrators to fetch dataModels and get the concrete dataType from associate enum value
// To conform RLTContentTypeDataModelFetching and use `fetchRLTContentTypeDataModels` function
extension CreatableViewModel: RLTContentTypeDataModelFetching {

    func fetchDataModelsAndApplyToViews() {
        fetchRLTContentTypeDataModels(location: location) { result in
            switch result {
            case .success(let contentTypeDataModels):
                var creatables: [GenericCreatableViews] = []
                contentTypeDataModels.forEach {
                    switch $0 {
                    case .banner(let bannerDataModel):
                        let bannerView = self.createBannerView(with: bannerDataModel)
                        creatables.append(GenericCreatableViews(creatables: AnyView(bannerView)))
                    }
                }
                self.views = creatables
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }

    private func createBannerView(with data: RLTBanner) -> BannerView {
        return BannerView(
            title: data.title,
            subtitle: data.subtitle,
            imageUrl: data.imageUrl, linkHandler: data.generateLinkHandler(openHandler: { url in
                UIApplication.shared.open(url, options: [:])
            }))
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
