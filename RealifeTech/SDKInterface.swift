//
//  SDKInterface.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import General
import APIUtilities
import Foundation

public class RealifeTech {

    public static var General: GeneralImplementing!

    /// Provides information required for the SDK to operate.
    /// This MUST be called before any other SDK functionality is acessed.
    /// Calling this function more than once will have no effect.
    /// - Parameter configuration: Struct containing the desired SDK configuration
    public static func configureSDK(with configuration: SDKConfiguration) {
        print("Someone called to configure the SDK")
        let sharedApiHeaderVariables = APIUtilities.setupAPI(with: "MWIwMjMyZTI0N2ZjMDM1Y2NjNDFmN2YyM2E4MWQ5ZmZiMTI0NTUzMmM2MDczMDVhYmI0Y2MyZjM3MjJlMTQ1Mg")
        General = GeneralImplementing()
    }
}
