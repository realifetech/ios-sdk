//
//  UserProfile.swift
//  ConcertLiveCore
//
//  Created by Nico on 19/01/2016.
//  Copyright © 2016 ConcertLive. All rights reserved.
//

import Foundation
// IMPORT_DEVICE_WRAPPER -- actually I think the other components should just access the device wrapper, or some other new data manager for the api.

// The only thing you need from this class is the Token storage
// It currently stored a UserProfile on the file system.
// If there isn't one saved when the class initialises, it makes one taking in the device id from UIDevice.
// The token is the user ID and if we have a token (even if no user exists), we say we're logged in.
@objc class UserProfileDataManager: NSObject {

    static let sharedInstance =  UserProfileDataManager()

    var deviceID: String { return userProfile.deviceID }
    var userID: String? { userProfile.userID }

    var userProfile: UserProfile {
        didSet {
            saveUserProfile()
        }
    }

    fileprivate var userProfileDataFilePath: URL = {
        var directory = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask).last!
        directory.appendPathComponent("/userProfile")
        return directory
    }()

    override init() {
        let fileManager = FileManager.default
        if let data = fileManager.contents(atPath: userProfileDataFilePath.path),
            let dic = try? NSKeyedUnarchiver.unarchivedObject(ofClasses: [NSDictionary.self], from: data) as? NSDictionary,
            let userProfile = UserProfile(propertyListRepresentation: dic),
            fileManager.fileExists(atPath: userProfileDataFilePath.path) {
            self.userProfile = userProfile
            super.init()
        } else {
            // TODO: Insert UIDevice wrapper here
            userProfile = UserProfile(deviceID: "B384BFF6-B0A9-4553-9HG3-A2CB66565E6F")
            super.init()
            saveUserProfile()
        }
    }

    func updateUserProfile(token: String? = nil) {
        userProfile.userID = token
        saveUserProfile()
    }

    fileprivate func saveUserProfile() {
        // Question: Do we need to log analytics when the device ID is set?
        // We should already perform a new device registration call. (remove when done)
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: userProfile.propertyListRepresentation(), requiringSecureCoding: true) else { return }
        do {
            try data.write(to: userProfileDataFilePath)
        } catch let error as NSError {
            print("error: could not write userProfile file: \(error)")
        }
    }

    @objc func isUserLoggedIn() -> Bool {
        return userProfile.userID != nil
    }

    func deleteUserProfileDataFile() {
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(atPath: userProfileDataFilePath.path)
        } catch let error as NSError {
            print("error: could not delete userProfile file: \(error)")
        }
    }

    func resetUserProfile() {
        userProfile.userID = nil
        deleteUserProfileDataFile()
    }
}
