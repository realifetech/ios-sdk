//
//  GeneralImplementing.swift
//  General
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import UIKit
import SwiftUI

class GeneralImplementing: General {

    private let deviceRegistrationWorker: DeviceRegistering
    private(set) var storedColours = Set<CustomisedColor>()

    init(deviceRegistrationWorker: DeviceRegistering) {
        self.deviceRegistrationWorker = deviceRegistrationWorker
    }
}

// MARK: - Device Registration
extension GeneralImplementing {

    public var sdkReady: Bool { deviceRegistrationWorker.sdkReady }
    public var deviceId: String { deviceRegistrationWorker.deviceId }

    public func registerDevice(_ completion: @escaping(Bool) -> Void) {
        deviceRegistrationWorker.registerDevice(completion)
    }
}

// MARK: - Colour Customisation
extension GeneralImplementing {

    public func setColor(_ color: UIColor, for type: ColorType) {
        storedColours.update(with: .init(type: type, color: color))
    }

    public func getColor(for type: ColorType) -> Color {
        guard let uiColor = storedColours.first(where: { $0.type == type })?.color else {
            return type.default
        }
        return Color(uiColor)
    }
}
