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

    @State var isModal = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextInput(placeholder: "URL", input: RealifeTech.Sell?.orderingJourneyUrl ?? "") { value in
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

        Spacer()
    }

    private func overrideWebOrderingJourneyUrl(_ newValue: String) {
        RealifeTech.set(webOrderingJourneyUrl: newValue)
    }
}

struct WebOrderingJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        WebOrderingJourneyView()
    }
}
