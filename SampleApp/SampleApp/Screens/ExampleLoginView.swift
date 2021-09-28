//
//  ExampleLoginView.swift
//  SampleApp
//
//  Created by Ross Patman Work on 24/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI

class ExampleLoginViewController: UIHostingController<ExampleLoginView> {

    init(completion: ((String, String?, String?) -> Void)?) {
        super.init(
            rootView: ExampleLoginView(completion: completion))
        rootView.dismiss = dismiss
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        return nil
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

struct ExampleLoginView: View {

    var completion: ((String, String?, String?) -> Void)?
    var dismiss: (() -> Void)?
    @State private var email: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""

    init(completion: ((String, String?, String?) -> Void)?) {
        self.completion = completion
    }

    var body: some View {
        VStack {
            TextField("Email", text: $email)
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            Button("Register") {
                completion?(email, firstName, lastName)
            }
        }
        .navigationBarTitle("Login Example")
        .padding()
    }
}

struct ExampleLoginView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleLoginView(completion: nil)
    }
}
