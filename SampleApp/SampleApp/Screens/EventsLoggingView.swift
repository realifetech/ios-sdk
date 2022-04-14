//
//  EventsLoggingView.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech All rights reserved.
//

import SwiftUI
import RealifeTech

final class LoggedEventViewModel: ObservableObject {
    @Published var type = "user"
    @Published var action = "externalLogin"
    @Published var userId = ""
    @Published var provider = ""
    @Published var result = ""

    func trackEvents() {
        let parameters = setupParameters(userId: userId, provider: provider)
        let event = AnalyticEvent(
            type: type,
            action: action,
            new: parameters,
            old: nil,
            version: "1.0",
            timestamp: Date())
        RealifeTech.Analytics.track(event) { [weak self] result in
            switch result {
            case .success(let response):
                self?.result = "isLogged: \(response.success)\n\(response.message ?? "")"
            case .failure(let error):
                self?.result = "Error with: \(error.localizedDescription)"
            }
        }
    }

    private func setupParameters(userId: String, provider: String) -> [String: Any] {
        var parameter: [String: Any] = [:]
        if !userId.isEmpty {
            parameter["userId"] = userId
        }
        if !provider.isEmpty {
            parameter["provider"] = provider
        }
        return parameter
    }
}

struct EventsLoggingView: View {

    @ObservedObject var viewModel = LoggedEventViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Type", text: $viewModel.type)
                .roundedBorderTextField()
            TextField("Action", text: $viewModel.action)
                .roundedBorderTextField()
            TextField("UserId", text: $viewModel.userId)
                .roundedBorderTextField()
            TextField("Provider", text: $viewModel.provider)
                .roundedBorderTextField()

            Button("Log") {
                viewModel.trackEvents()
            }

            Divider()
            resultView
        }
        .navigationBarTitle("Log Events")
        .padding()

        Spacer()
    }

    var resultView: some View {
        ResultView(
            title: "Logging Result",
            message: viewModel.result)
    }
}

struct EventsLoggingView_Previews: PreviewProvider {
    static var previews: some View {
        EventsLoggingView(viewModel: LoggedEventViewModel())
    }
}
