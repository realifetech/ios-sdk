//
//  WebPageTypeGetterView.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech All rights reserved.
//

import SwiftUI
import RealifeTech

struct WebPageTypeGetterView: View {

    @EnvironmentObject private var errorHandler: ErrorHandler
    @State private var selectedType: WebPageType = .privacy
    @State var result = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Picker("Plase select a WebPageType", selection: $selectedType) {
                ForEach(WebPageType.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }

            Button("Get") {
                do {
                    try getWebPageType()
                } catch {
                    errorHandler.handle(error: error)
                }
            }
            Divider()
            resultView
        }
        .navigationBarTitle("WebPageType Getter")
        .padding()

        Spacer()
    }

    var resultView: some View {
        ResultView(
            title: "WebPageType Result",
            message: result)
    }

    private func getWebPageType() throws {
        guard let content = RealifeTech.Content else {
            throw StandardError.deviceNotRegistration
        }
        content.getWebPage(forType: selectedType) { response in
            switch response {
            case .success(let webPage):
                result = "Web Page for type: \(selectedType.rawValue) with URL: \(webPage.url)"
            case .failure(let error):
                result = "Get web page failure due to error: \(error.localizedDescription)"
            }
        }
    }
}

struct WebPageTypeGetterView_Previews: PreviewProvider {
    static var previews: some View {
        WebPageTypeGetterView()
    }
}
