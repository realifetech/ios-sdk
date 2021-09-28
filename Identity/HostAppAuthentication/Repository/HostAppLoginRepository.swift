//
//  HostAppLoginRepository.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 21/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public final class HostAppLoginRepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }
}

extension HostAppLoginRepository: HostAppLoginDataProviding {

    func generateNonce(completion: @escaping (Result<String, Error>) -> Void) {
        graphQLManager.dispatchMutation(
            mutation: ApolloType.GenerateNonceMutation(),
            cacheResultToPersistence: false) { result in
            switch result {
            case .success(let response):
                return completion(.success(response.data?.generateNonce?.token ?? ""))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }

    func authenticateUserBySignedUserInfo(userInfo: HostAppUserInfo,
                                          salt: String,
                                          nonce: String,
                                          signature: String,
                                          completion: @escaping AuthenticateUserHandler) {
        let input = ApolloType.SignedUserInfoInput(email: userInfo.emailAddress,
                                                   firstName: userInfo.firstName,
                                                   lastName: userInfo.lastName,
                                                   dob: nil,
                                                   phone: nil,
                                                   nonce: nonce,
                                                   signature: signature)
        graphQLManager.dispatchMutation(
            mutation: ApolloType.AuthenticateUserBySignedUserInfoMutation(input: input),
            cacheResultToPersistence: false) { [weak self] result in
            switch result {
            case .success(let response):
                let apolloToken = response.data?.authenticateUserBySignedUserInfo?.fragments.authToken
                guard let token = self?.generateOAuthToken(apolloToken: apolloToken) else {
                    return completion(.failure(APIError.unparseableError()))
                }
                return completion(.success(token))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }

    func generateOAuthToken(apolloToken: ApolloType.AuthToken?) -> OAuthToken? {
        guard let token = apolloToken else {
            return nil
        }
        return OAuthToken(accessToken: token.accessToken,
                                    refreshToken: token.refreshToken,
                                    expiresIn: token.expiresIn,
                                    tokenType: token.tokenType,
                                    scope: token.scope)
    }
}
