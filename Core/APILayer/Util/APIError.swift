//
//  APIError.swift
//  ConcertLiveCore
//
//  Created by Emal SAIFI on 23/11/2017.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

enum MockErrorType: Int {
    case genericError
}

final class MockAPIError: Error {

    var type: MockErrorType

    private init(type: MockErrorType) {
        self.type = type
    }

    static func genericError() -> MockAPIError {
        return MockAPIError(type: .genericError)
    }
}

extension MockAPIError: LocalizedError {

    public var errorDescription: String? {
        switch type {
        case .genericError:
            return "UNPARSEABLE_ERROR".coreLocalizedString
        }
    }
}

public final class APIError: Error {

    public var data: Data?
    public var title: String?
    public var message: String?
    public var statusCode: Int?

    public var badRequest: Bool {
        return statusCode == 400
    }

    public var notFound: Bool {
        return statusCode == 404
    }

    public var clientError: Bool {
        guard let code = statusCode else { return false }
        return code >= 400 && code < 500
    }

    public var unAuthenticated: Bool {
        return statusCode == 401 || statusCode == 403
    }

    public var logicError: Bool { // errors which the UI won't show but may need to handle
        return statusCode == 422
    }

    public init() { }

    static func constructedError(data: Data, statusCode: Int? = nil) -> APIError {
        let error = APIError()
        error.data = data
        error.statusCode = statusCode
        if let decodedError = try? JSONDecoder().decode([String: String].self, from: data) {
            let message = decodedError["message"] ?? decodedError["error_description"]
            error.title = nil
            error.message = message
        } else if let response = try? JSONDecoder().decode(StandardSenderResponse.self, from: data) {
            error.title = nil
            error.message = response.message
        } else {
            error.title = "ERROR".coreLocalizedString
            error.message = "UNPARSEABLE_ERROR".coreLocalizedString
        }
        return error
    }

    static func constructedError(error: Error) -> APIError {
        if let error = error as? APIError {
            return error
        }
        let newError = APIError()
        newError.message = error.localizedDescription
        return newError
    }

    static func constructedError(title: String?, message: String) -> APIError {
        let error = APIError()
        error.title = title
        error.message = message
        return error
    }

	static func unparseableError() -> APIError {
		let error = APIError()
        error.title = "ERROR".coreLocalizedString
		error.message = "UNPARSEABLE_ERROR".coreLocalizedString
		return error
	}
}
