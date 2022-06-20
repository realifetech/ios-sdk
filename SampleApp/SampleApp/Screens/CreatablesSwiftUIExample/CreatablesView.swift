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
    @ObservedObject private var viewModel = CreatablesViewModel()

    var body: some View {
        HStack(spacing: 16) {
            Spacer()
            TextField("location", text: $viewModel.location)
                .roundedBorderTextField()
            VStack {
                // Use case 1: Use viewFatcher to auto generate view after data comes back
                Button("FETCH (Creatables)") {
                    fetchCreatables()
                }
                // Use case 2: Fetch data without view fetcher
                Button("FETCH (Data)") {
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
