//
//  WebOrderingJourneyView.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech All rights reserved.
//

import SwiftUI
import RealifeTech

struct WebOrderingJourneyView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject private var errorHandler: ErrorHandler
    @State var isModal = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextInput(placeholder: "URL",
                      input: RealifeTech.Sell?.orderingJourneyUrl ?? ""
            ) { value in
                overrideWebOrderingJourneyUrl(value)
            }

            Button("Launch") {
                isModal.toggle()
            }
            .sheet(isPresented: $isModal) {
                RealifeTech.Sell?.createOrderingJourneyView()
            }
        }
        .navigationBarTitle("Web Ordering Journey")
        .padding()
        .onAppear(perform: {
            do {
                try checkEmptySell()
            } catch {
                errorHandler.handle(error: error, action: {
                    self.presentationMode.wrappedValue.dismiss()
                })
            }
        })

        Spacer()
    }

    private func checkEmptySell() throws {
        guard RealifeTech.Sell != nil else {
            throw StandardError.deviceNotRegistration
        }
    }

    private func overrideWebOrderingJourneyUrl(_ newValue: String) {
        guard !newValue.isEmpty else { return }
        RealifeTech.set(webOrderingJourneyUrl: newValue)
    }
}

struct WebOrderingJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        WebOrderingJourneyView()
    }
}
