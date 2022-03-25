//
//  IdentityView.swift
//  SampleApp
//
//  Created by Ross Patman Work on 28/01/2022.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import SwiftUI
import RealifeTech

struct IdentityView: View {

    @State var userId = ""
    @State var firstName = ""
    @State var email = ""
    @State var result = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextInput(placeholder: "User ID", input: "") { value in
                userId = value
            }
            TextInput(placeholder: "firstName", input: "") { value in
                firstName = value
            }
            TextInput(placeholder: "email", input: "") { value in
                email = value
            }

            Button("Identify") {
                identify()
            }

            Button("Clear") {
                clear()
            }

            Divider()
            resultView
        }
        .navigationBarTitle("Identity Control")
        .padding()

        Spacer()
    }

    var resultView: some View {
        ResultView(
            title: "Result:",
            message: result)
    }

    private func identify() {
        RealifeTech.Identity.identify(userId: userId,
                                      traits: [.firstName: firstName,
                                               .email: email,
                                               .lastName: "ABC",
                                               .dateOfBirth: "1956-03-22T10:21:32Z"]) { response in
            switch response {
            case .success(_):
                result = "Success. You will now see the userId \(userId) logged as Analytic Events"
            case .failure(let error):
                result = "Error with: \(error.localizedDescription)"
            }
        }
    }

    private func clear() {
        RealifeTech.Identity.clear()
        result = "Cleared. Your Analytic Events should now not contain a userId."
    }
}

struct IdentityView_Previews: PreviewProvider {
    static var previews: some View {
        IdentityView()
    }
}
