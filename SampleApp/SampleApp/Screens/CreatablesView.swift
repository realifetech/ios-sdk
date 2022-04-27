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

    @Environment(\.presentationMode) var presentation
    @EnvironmentObject private var errorHandler: ErrorHandler
    @ObservedObject private var viewModel = CreatableViewModel()

    init() {
        Theme.navigationBarColors(background: .white, titleColor: UIColor(Color("client")))
    }

    var backButton : some View { Button(action: {
        self.presentation.wrappedValue.dismiss()
        }) {
            HStack {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("client"))
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color("client").opacity(0.8)
            ScrollView {
                VStack {
                    ForEach(viewModel.views, id: \.id) { item in
                        item.creatables
                    }
                    Text(viewModel.error)
                    Spacer()
                }
            }.padding(EdgeInsets(top: 100, leading: 16, bottom: 16, trailing: 16))
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            do {
                try viewModel.fetchCreatables()
            } catch {
                errorHandler.handle(error: error)
            }
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: backButton)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("icon2")
                    .resizable()
                    .frame(width: 150, height: 40, alignment: .leading)
            }
        }
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

    func fetchCreatables(location: String = "homepage-top-view") throws {
        guard let viewFetcher = viewFetcher else {
            throw StandardError.deviceNotRegistration
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
