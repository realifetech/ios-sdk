//
//  ModulesView.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech All rights reserved.
//

import SwiftUI
import RealifeTech

struct ModulesView: View {

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("General")) {
                    NavigationLink("Register Device", destination: DeviceRegistrationView())
                }
                Section(header: Text("Analytics")) {
                    NavigationLink("Log Events", destination: EventsLoggingView(store: LoggedEventStore()))
                }
                Section(header: Text("Audience")) {
                    NavigationLink("Audience Checking", destination: AudienceCheckingView())
                }
                Section(header: Text("Content")) {
                    NavigationLink("WebPageType Getter", destination: WebPageTypeGetterView())
                }
                Section(header: Text("Sell")) {
                    NavigationLink("Web Ordering Journey", destination: WebOrderingJourneyView())
                }
                Section(header: Text("Identity")) {
                    Text("Login")
                }
                Section(header: Text("Campaign Automation")) {
                    let viewFetcher = createRLTViewFetcher()
                    let viewModel = CreatableViewModel(viewFetcher: viewFetcher)
                    NavigationLink("Creatables Example", destination: CreatablesView(viewModel: viewModel))
                }
                Section(header: Text("Identity")) {
                    NavigationLink("Identity Control", destination: IdentityView())
                }
            }
            .navigationBarTitle("Realife Tech SDK")
        }
    }

    private func createRLTViewFetcher() -> RLTViewFetcher {
        let viewFetcher = RealifeTech.CampaignAutomation.viewFetcher
        viewFetcher.factories = [.banner: BannerViewFactory()]
        return viewFetcher
    }
}
