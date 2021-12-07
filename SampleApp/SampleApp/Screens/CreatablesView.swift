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

    @State var creatables: [AnyView] = []
    @State var error: String = ""

    var body: some View {
        VStack {
            creatables.first ?? AnyView(Text("No view available"))
            Text(error)
            Spacer()
        }
        .onAppear(perform: {
            RealifeTech.CampaignAutomation.viewFetcher.factories = [.banner: BannerViewFactory()]
            fetchTopView()
        })
    }

    func fetchTopView() {
        RealifeTech.CampaignAutomation.viewFetcher.fetch(location: "homepage-top-view") { result in
            switch result {
            case .success(let fetchedCreatables):
                creatables = fetchedCreatables.map { $0.unwrappedGenericView }.compactMap { $0 }
            case .failure(let error): self.error = error.localizedDescription
            }
        }
    }
}

struct CreatablesView_Previews: PreviewProvider {
    static var previews: some View {
        CreatablesView()
    }
}



struct BannerViewFactory: RLTBannerFactory {
    func create(from dataModel: RLTBanner) -> RLTCreatable? {
        return BannerView(title: dataModel.title ?? "Title",
                          subtitle: "Subtitle",
                          linkHandler: dataModel.generateLinkHandler(openHandler: { url in
                            UIApplication.shared.open(url, options: [:])
                          })
        )
    }
}



struct BannerView: View, RLTViewCreatable {

    var header: String?
    var subtitle: String?
    var linkHandler: (() -> Void)?

    var body: some View {
        VStack {
            Text(header ?? "").font(.title)
            Text(subtitle ?? "").font(.subheadline)
        }.onTapGesture {
            linkHandler?()
        }
    }

    init(title: String, subtitle: String, linkHandler: @escaping () -> Void) {
        self.header = title
        self.subtitle = subtitle
        self.linkHandler = linkHandler
    }
}
