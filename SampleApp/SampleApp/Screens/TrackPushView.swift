//
//  TrackPushView.swift
//  SampleApp
//
//  Created by Aleksandrs Proskurins on 17/06/2022.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import SwiftUI
import RealifeTech

final class TrackPushViewModel: ObservableObject {

    private let requestInProgressString = "In progress..."

    @Published var campaignId = "campaignId123"
    @Published var pushContentId = "pushContentId123"
    @Published var pushMessageId = "pushMessageId123"
    @Published private(set) var result = ""

    var trackButtonDisabled: Bool {
        campaignId.isEmpty || pushContentId.isEmpty || pushMessageId.isEmpty || result == requestInProgressString
    }

    func trackPush(event: PushEvent) throws {
        guard let communicate = RealifeTech.Communicate else {
            throw StandardError.deviceNotRegistered
        }
        result = requestInProgressString
        communicate.trackPush(event: event, trackInfo: createPushPayload()) { [weak self] result in
            switch result {
            case .success(let success):
                self?.result = "\(event.rawValue): \(success ? "Success" : "Failure")"
            case .failure(let error):
                self?.result = "Error with: \(error.localizedDescription)"
            }
        }
    }

    private func createPushPayload() -> [String: Any] {
        var payload: [String: Any] = [:]
        payload["campaignId"] = campaignId
        payload["pushContentId"] = pushContentId
        payload["pushMessageId"] = pushMessageId
        return payload
    }
}

struct TrackPushView: View {

    @EnvironmentObject private var errorHandler: ErrorHandler
    @ObservedObject var viewModel = TrackPushViewModel()

    var resultView: some View {
        ResultView(
            title: "Tracking Result",
            message: viewModel.result)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                TextField("Campaign Id", text: $viewModel.campaignId)
                    .roundedBorderTextField()
                TextField("Push Content Id", text: $viewModel.pushContentId)
                    .roundedBorderTextField()
                TextField("Push Message Id", text: $viewModel.pushMessageId)
                    .roundedBorderTextField()
                Button("Track Push Received") {
                    tackPush(event: .received)
                }
                .disabled(viewModel.trackButtonDisabled)
                Button("Track Push Opened") {
                    tackPush(event: .opened)
                }
                .disabled(viewModel.trackButtonDisabled)
                Divider()
                resultView
            }
            .navigationBarTitle("Track Push")
            .padding()
            Spacer()
        }
    }

    private func tackPush(event: PushEvent) {
        do {
            try viewModel.trackPush(event: event)
        } catch {
            errorHandler.handle(error: error)
        }
    }
}

struct TrackPushView_Previews: PreviewProvider {
    static var previews: some View {
        TrackPushView()
    }
}
