//
//  ModulesView.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech All rights reserved.
//

import SwiftUI

struct ModulesView: View {

    let hostAppLoginHandler = HostAppLoginHandler()

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
                    NavigationLink("Host App Login",
                                   destination: hostAppLoginHandler.createLoginViewController().rootView)
                    NavigationLink("Host App Logout", destination: ExampleLogoutView())
                }
            }
            .navigationBarTitle("Realife Tech SDK")
        }
    }
}

struct ModulesView_Previews: PreviewProvider {
    static var previews: some View {
        ModulesView()
    }
}
