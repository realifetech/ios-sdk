//
//  TextInput.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech All rights reserved.
//

import SwiftUI

struct TextInput: View {

    let placeholder: String
    @State var input: String
    let onCommitAction: ((String) -> Void)?

    init(
        placeholder: String,
        input: String,
        onCommitAction: ((String) -> Void)?
    ) {
        self.placeholder = placeholder
        self.input = input
        self.onCommitAction = onCommitAction
    }

    var body: some View {
        TextField(
            placeholder,
            text: $input,
            onEditingChanged: { _ in }) {
            onCommitAction?(input)
        }
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color(.separator), lineWidth: 1)
        )
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TextInput(placeholder: "Placeholder", input: "", onCommitAction: nil)
    }
}
