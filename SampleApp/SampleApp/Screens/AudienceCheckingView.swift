//
//  AudienceCheckingView.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech All rights reserved.
//

import SwiftUI
import RealifeTech

struct AudienceCheckingView: View {

    @EnvironmentObject private var errorHandler: ErrorHandler
    @State var audienceId = ""
    @State var result = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextInput(placeholder: "Audience ID", input: "") { value in
                audienceId = value
            }

            Button("Check") {
                do {
                    try checkAudience()
                } catch {
                    errorHandler.handle(error: error)
                }
            }

            Divider()
            resultView
        }
        .navigationBarTitle("Audience Checking")
        .padding()

        Spacer()
    }

    var resultView: some View {
        ResultView(
            title: "Checking Result",
            message: result)
    }

    private func checkAudience() throws {
        guard let audiences = RealifeTech.Audiences else {
            throw StandardError.deviceNotRegistration
        }
        audiences.deviceIsMemberOfAudience(audienceId: audienceId) { response in
            switch response {
            case .success(let isMember):
                result = "Success with result isMember: \(isMember)"
            case .failure(let error):
                result = "Error with: \(error.localizedDescription)"
            }
        }
    }
}

struct AudienceCheckingView_Previews: PreviewProvider {
    static var previews: some View {
        AudienceCheckingView()
    }
}
