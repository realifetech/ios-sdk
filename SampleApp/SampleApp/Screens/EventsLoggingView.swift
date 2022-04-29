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

    func trackEvents() throws {
        guard let analytics = RealifeTech.Analytics else {
            throw StandardError.deviceNotRegistered
        }
        let parameters = setupParameters(userId: userId, provider: provider)
        let event = AnalyticEvent(
            type: type,
            action: action,
            new: parameters,
            old: nil,
            version: "1.0",
            timestamp: Date())
        analytics.track(event) { [weak self] response in
            switch response {
            case .success(let isLogged):
                self?.result = "Result isLogged: \(isLogged)"
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

    @EnvironmentObject private var errorHandler: ErrorHandler
    @ObservedObject var viewModel = LoggedEventViewModel()

    var body: some View {
        ScrollView {
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
                    do {
                        try viewModel.trackEvents()
                    } catch {
                        errorHandler.handle(error: error)
                    }
                }

                Divider()
                resultView
            }
            .navigationBarTitle("Log Events")
            .padding()

            Spacer()
        }
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
