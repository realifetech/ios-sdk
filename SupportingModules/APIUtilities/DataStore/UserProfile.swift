//
//  UserProfile.swift
//  APIUtilities
//
//  Created by Olivier Butler on 28/09/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation

struct UserProfile {
    let deviceID: String
    var userID: String?
    var userIDReal: Int?
    var emailAddress: String?
    var firstName: String?
    var lastName: String?
    var gender: String?
    var dateOfBirth: Date?
    var phoneNumber: String?
    var availableCredit: Double = 0.0
    enum Key: String {
        case DeviceID, UserID, EmailAddress, FirstName, LastName, PhoneNumber, AvailableCredit, UserIDReal
    }
    init(deviceID: String) {
        self.deviceID = deviceID
    }
    var fullName: String {
        var toReturn = ""
        if let firstName = firstName {
            toReturn = "\(firstName)"
        }
        if let lastName = lastName {
            toReturn = "\(toReturn) \(lastName)"
        }
        return toReturn
    }
}

extension UserProfile: PropertyListReadable {
    func propertyListRepresentation() -> NSDictionary {
        let representation: [Key: AnyObject?] = [
            .DeviceID: deviceID as AnyObject?,
            .UserID: userID as AnyObject?,
            .UserIDReal: userIDReal as AnyObject?,
            .EmailAddress: emailAddress as AnyObject?,
            .FirstName: firstName as AnyObject?,
            .LastName: lastName as AnyObject?,
            .PhoneNumber: phoneNumber as AnyObject?,
            .AvailableCredit: availableCredit as AnyObject?
        ]
        return dictionaryRemovingNilValuesFromDictionary(representation.map { ($0.rawValue, $1) }) as NSDictionary
    }
    init?(propertyListRepresentation: NSDictionary?) {
        guard let values = propertyListRepresentation as? [String: AnyObject] else { return nil }
        if let deviceID = values[Key.DeviceID.rawValue] as? String {
            self.init(deviceID: deviceID)
            self.userID = values[Key.UserID.rawValue] as? String
            self.userIDReal = values[Key.UserIDReal.rawValue] as? Int
            self.emailAddress = values[Key.EmailAddress.rawValue] as? String
            self.firstName = values[Key.FirstName.rawValue] as? String
            self.lastName = values[Key.LastName.rawValue] as? String
            self.phoneNumber = values[Key.PhoneNumber.rawValue] as? String
            if let availableCredit = values[Key.AvailableCredit.rawValue] as? Double {
                self.availableCredit = availableCredit
            }
        } else {
            return nil
        }
    }
}

protocol PropertyListReadable {
    func propertyListRepresentation() -> NSDictionary
    init?(propertyListRepresentation: NSDictionary?)
}
