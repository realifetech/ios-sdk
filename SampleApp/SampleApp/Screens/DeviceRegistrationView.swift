//
//  DeviceRegistrationView.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech All rights reserved.
//

import SwiftUI
import RealifeTech

final class DeviceRegistrationViewModel: ObservableObject {

    @Published var appCode = ""
    @Published var clientSecret = ""
    @Published var result = ""

    private func configureRealifeTechSDK() {
        let configuration = SDKConfiguration(
            appCode: appCode,
            clientSecret: clientSecret,
            apiUrl: "https://api-staging.livestyled.com/v3",
            graphQLApiUrl: "https://staging-graphql-eu.realifetech.com")
        RealifeTech.configureSDK(with: configuration)
    }

    func registerDevice() {
        configureRealifeTechSDK()
        RealifeTech.General.registerDevice { [weak self] in
            let isReady = RealifeTech.General.sdkReady ? "Yes!" : "No!"
            self?.result = "Is SDK ready?  \(isReady)"

            NotificationRegistrationHelper().registerForRemoteNotification()
       }
    }
}

struct DeviceRegistrationView: View {

    @ObservedObject var viewModel = DeviceRegistrationViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                TextField("appCode", text: $viewModel.appCode)
                    .roundedBorderTextField()
                TextField("clientSecret", text: $viewModel.clientSecret)
                    .roundedBorderTextField()
                Button("Register") {
                    viewModel.registerDevice()
                }
                Divider()
                resultView
            }
            .navigationBarTitle("Register Device")
            .padding()

            Spacer()
        }
    }

    var resultView: some View {
        ResultView(
            title: "Registration Result",
            message: viewModel.result)
    }
}

struct DeviceRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceRegistrationView()
    }
}
