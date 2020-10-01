//
//  UserProfile.swift
//  ConcertLiveCore
//
//  Created by Nico on 19/01/2016.
//  Copyright © 2016 ConcertLive. All rights reserved.
//

import Foundation
// IMPORT_DEVICE_WRAPPER -- actually I think the other components should just access the device wrapper, or some other new data manager for the api.

@objc class UserProfileDataManager: NSObject {

    static let sharedInstance =  UserProfileDataManager()

    var deviceID: String = "B384BFF6-B0A9-4553-9HG3-A2CB66565E6F" // Device ID from UIBundle
    var userID: String? // Token from API

    func updateUserProfile(token: String? = nil) {
        userID = token
    }

    func resetUserProfile() {
        userID = nil
    }
}
