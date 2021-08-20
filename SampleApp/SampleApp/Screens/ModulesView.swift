//
//  ModulesView.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Olivier Butler. All rights reserved.
//

import SwiftUI

struct ModulesView: View {

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("General")) {
                    Text("Register Device")
                }
                Section(header: Text("Analytics")) {
                    Text("Log Events")
                }
                Section(header: Text("Audience")) {
                    Text("Audience Checking")
                }
                Section(header: Text("Content")) {
                    Text("Web Page Type")
                }
                Section(header: Text("Sell")) {
                    Text("Web Ordering Journey")
                }
                Section(header: Text("Identity")) {
                    Text("Login")
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
