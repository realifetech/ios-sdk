//
//  RealifeTechImage.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

public enum RealifeTechImageKey {
    case olivierFace
}

protocol ImageStorable {
    func set(_: RealifeTechImageKey, image: UIImage)
    func get(_: RealifeTechImageKey) -> UIImage?
}

class ImageStore: ImageStorable {
    private var storedImages = [RealifeTechImageKey: UIImage]()

    func set(_ key: RealifeTechImageKey, image: UIImage) {
        storedImages[key] = image
    }

    func get(_ key: RealifeTechImageKey) -> UIImage? {
        return storedImages[key]
    }
}
