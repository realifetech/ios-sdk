//
//  TextInput.swift
//  SampleApp
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech All rights reserved.
//

import SwiftUI
import Combine

struct TextInput: View {

    let placeholder: String
    @State var input: String
    let onChangeAction: ((String) -> Void)?

    init(
        placeholder: String,
        input: String,
        onChangeAction: ((String) -> Void)?
    ) {
        self.placeholder = placeholder
        self.input = input
        self.onChangeAction = onChangeAction
    }

    var body: some View {
        TextField(
            placeholder,
            text: $input)
            .onReceive(Just(input)) {
                onChangeAction?($0)
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
        TextInput(placeholder: "Placeholder", input: "", onChangeAction: nil)
    }
}
