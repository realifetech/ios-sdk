//
//  EventsLoggingView.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech All rights reserved.
//

import SwiftUI
import RealifeTech

final class LoggedEventStore: ObservableObject {
    @Published var type = "user"
    @Published var action = "externalLogin"
    @Published var parameters = "[\"userId\": \"a3890e983e\", \"provider\": \"ticketmaster\"]"
}

struct EventsLoggingView: View {

    @State var result = ""
    @ObservedObject var store: LoggedEventStore

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextInput(placeholder: "Type", input: store.type) { value in
                store.type = value
            }
            TextInput(placeholder: "Action", input: store.action) { value in
                store.action = value
            }
            TextInput(
                placeholder: "Parameters",
                input: store.parameters) { value in
                store.parameters = value
            }

            Button("Log") {
                logEvents()
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
            message: result)
    }

    private func logEvents() {
        let event = AnalyticEvent(
            type: store.type,
            action: store.action,
            new: ["userId": "a3890e983e", "provider": "ticketmaster"],
            old: nil,
            version: "1.0",
            timestamp: Date())
        RealifeTech.Analytics.logEvent(event) { response in
            switch response {
            case .success(let isLogged):
                result = "Success with result isLogged: \(isLogged)"
            case .failure(let error):
                result = "Error with: \(error.localizedDescription)"
            }
        }
    }
}

struct EventsLoggingView_Previews: PreviewProvider {
    static var previews: some View {
        EventsLoggingView(store: LoggedEventStore())
    }
}
