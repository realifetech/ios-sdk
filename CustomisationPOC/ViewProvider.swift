//
//  ViewProvider.swift
//  RealifeTech
//
//  Created by Olivier Butler on 11/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

public final class ViewProvider: ViewProviding {

    private let customisationStore: CustomisationStorable

    init(customisationStore: CustomisationStorable) {
        self.customisationStore = customisationStore
    }

    public func makeSomeView(frame: CGRect) -> UIView? {
        let someView = SomeView.init(frame: frame)
        guard
            let backgroundColour = customisationStore.colourStore.get(key: .backgorund),
            let headlineFont = customisationStore.fontStore.get(key: .headline),
            let headlineString = customisationStore.localisableStringStore.get(.proofOfConceptHeadline),
            let happyAppBool = customisationStore.configurationStore.get(.isThisAHappyApp),
            let image = customisationStore.imageStore.get(.olivierFace)
        else {
            return nil
        }
        someView.contentView.backgroundColor = backgroundColour
        someView.customFontLabel.font = headlineFont
        someView.customFontLabel.text = headlineString
        someView.arbitraryValueLabel.text = "The happiness feature is \(happyAppBool ? "turned on" : "disabled")"
        someView.imageView.image = image
        return someView
    }

    private func registerFont(fontName: String) throws -> String {
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: fontName, withExtension: ".ttf") else {
            throw QuickError(message: "Could not find resource with that name")
        }
        guard let fontDataProvider = CGDataProvider(url: url as CFURL) else {
            throw QuickError(message: "Could not create font data provider for \(url).")
        }
        guard let font = CGFont(fontDataProvider) else {
            throw QuickError(message: "Could not make font using data provider")
        }
        var error: Unmanaged<CFError>?
        guard CTFontManagerRegisterGraphicsFont(font, &error) else {
            throw error!.takeUnretainedValue()
        }
        guard let name = font.fullName else {
            throw QuickError(message: "Could not get font name")
        }
        return name as String
    }
}

struct QuickError: Error {
    var message: String
}
