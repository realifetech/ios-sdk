//
//  HostAppLoginRepository.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 21/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

class HostAppLoginRepository: HostAppLoginDataProviding {
    func generateNonce(completion: (Result<String, Error>) -> Void) { }
    func authenticateUserBySignedUserInfo(userInfo: HostAppUserInfo,
                                          salt: String,
                                          nonce: String,
                                          signature: String,
                                          completion: AuthenticateUserBySignedUserInfoHandler) { }
}

/*
 graphQLManager.dispatch(
     query: ApolloType.BelongsToAudienceWithExternalIdQuery(externalAudienceId: audienceId),
     cachePolicy: .returnCacheDataElseFetch) { result in
     switch result {
     case .success(let response):
         return completion(.success(response.data?.me?.device?.belongsToAudienceWithExternalId ?? false))
     case .failure(let error):
         return completion(.failure(error))
     }
 }
 
 */
