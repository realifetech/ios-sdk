//
//  ErrorHandler.swift
//  SampleApp
//
//  Created by YOU-HSUAN YU on 2022/4/27.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import SwiftUI

struct ErrorAlert: Identifiable {
    var id = UUID()
    var message: String
    var dismissAction: (() -> Void)?
}

class ErrorHandler: ObservableObject {
    @Published var currentAlert: ErrorAlert?

    func handle(error: Error, action: (() -> Void)? = nil) {
        currentAlert = ErrorAlert(message: error.localizedDescription, dismissAction: {
            action?()
        })
    }
}

struct HandleErrorsByShowingAlertViewModifier: ViewModifier {
    @StateObject var errorHandler = ErrorHandler()

    func body(content: Content) -> some View {
        content
            .environmentObject(errorHandler)
            .background(
                EmptyView()
                    .alert(item: $errorHandler.currentAlert) { currentAlert in
                        Alert(title: Text("Error"),
                              message: Text(currentAlert.message),
                              dismissButton: .default(Text("OK")) {
                                currentAlert.dismissAction?()
                            })
                    }
            )
    }
}

extension View {
    func withErrorHandling() -> some View {
        modifier(HandleErrorsByShowingAlertViewModifier())
    }
}
