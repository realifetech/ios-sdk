//
//  DeviceRegistrationView.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech All rights reserved.
//

import SwiftUI
import RealifeTech

struct DeviceRegistrationView: View {

    @State var result = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button("Register") {
                RealifeTech.General.registerDevice {
                    let isReady = RealifeTech.General.sdkReady
                        ? "Yes!"
                        : "No!"
                    result = "Is SDK ready?  \(isReady)"
                }
            }
            Divider()
            resultView
        }
        .navigationBarTitle("Register Device")
        .padding()

        Spacer()
    }

    var resultView: some View {
        ResultView(
            title: "Registration Result",
            message: result)
    }
}

struct DeviceRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceRegistrationView()
    }
}
