//
//  AudienceChecking.swift
//  Audiences
//
//  Created by Jonathon Albert on 07/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation

public enum AudienceCheckingResult {
    case success
    case failure
}

public protocol AudienceChecking {
    func deviceIsMemberOfAudience(audienceId: String, callback: @escaping (Result<Bool, Error>) -> Void)
}
