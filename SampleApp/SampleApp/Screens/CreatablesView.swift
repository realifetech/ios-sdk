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

    @ObservedObject private var viewModel = CreatableViewModel()

    var body: some View {
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
        .onAppear(perform: {
            viewModel.fetchCreatables()
        })
    }
}

struct GenericCreatableViews {
    let id = UUID()
    let creatables: AnyView
}

final class CreatableViewModel: ObservableObject {

    @Published var error: String = ""
    @Published var views: [GenericCreatableViews] = []

    private var viewFetcher: RLTViewFetcher? {
        let viewFetcher = RealifeTech.CampaignAutomation?.viewFetcher
        viewFetcher?.factories = [.banner: BannerViewFactory()]
        return viewFetcher
    }

    func fetchCreatables(location: String = "homepage-top-view") {
        viewFetcher?.fetch(location: location) { [weak self] result in
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
