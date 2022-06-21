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
                    NavigationLink("Log Events", destination: EventsLoggingView())
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
                    NavigationLink("Creatables Example", destination: CreatablesView())
                }
                Section(header: Text("Identity")) {
                    NavigationLink("Identity Control", destination: IdentityView())
                }
                Section(header: Text("Communicate")) {
                    NavigationLink("Track Push Notifications", destination: TrackPushView())
                }
            }
            .navigationBarTitle("Realife Tech SDK")
        }
        .navigationViewStyle(.stack)
        .withErrorHandling()
    }
}
