//
//  AudienceChecking.swift
//  Audiences
//
//  Created by Jonathon Albert on 07/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation

public protocol AudienceChecking {
    func deviceIsMemberOfAudience(audienceId: String, completion: @escaping (Result<Bool, Error>) -> Void)
}
