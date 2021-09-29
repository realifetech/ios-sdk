//
//  ExampleLogoutView.swift
//  SampleApp
//
//  Created by Ross Patman Work on 29/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI
import RealifeTech

struct ExampleLogoutView: View {
    var body: some View {
        Button("Logout") {
            RealifeTech.Identity.logout()
        }
    }
}

struct ExampleLogoutView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleLogoutView()
    }
}
