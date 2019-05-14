//
//  NetworkErrorCheckable.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 14/05/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkErrorCheckable {
    static func inNotNetworkError(resError: Error?) -> (result: Bool, errorString: String)
}

extension NetworkErrorCheckable {
    static func inNotNetworkError(resError: Error?) -> (result: Bool, errorString: String) {
        var errorString = ""
        if let error = resError {
            if let aferror = error as? AFError {
                switch aferror {
                case .invalidURL(let url):
                    errorString = "Invalid URL: \(url) - \(aferror.localizedDescription)"
                case .parameterEncodingFailed(let reason):
                    errorString = "Parameter encoding failed: \(aferror.localizedDescription)\nFailure Reason: \(reason)"
                case .multipartEncodingFailed(let reason):
                    errorString = "Multipart encoding failed: \(aferror.localizedDescription) \n Failure Reason: \(reason)"
                case .responseValidationFailed(let reason):
                    errorString = "Response validation failed: \(aferror.localizedDescription) \n Failure Reason: \(reason)"
                    
                    switch reason {
                    case .dataFileNil, .dataFileReadFailed:
                        errorString += "\nDownloaded file could not be read"
                    case .missingContentType(let acceptableContentTypes):
                        errorString += "\nContent Type Missing: \(acceptableContentTypes)"
                    case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                        errorString += "\nResponse content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)"
                    case .unacceptableStatusCode(let code):
                        errorString += "\nResponse status code was unacceptable: \(code)"
                    }
                case .responseSerializationFailed(let reason):
                    errorString = "Response serialization failed: \(error.localizedDescription)\nFailure Reason: \(reason)"
                default:
                    errorString = "Underlying error: \(String(describing: aferror.underlyingError))"
                    break
                }
            } else if let urlError = error as? URLError{
                errorString = "URLError occurred: \(urlError)"
            }else {
                errorString = "Underlying error: \(error)"
            }
            return (result: false, errorString: errorString)
        }
        return (result: true, errorString: errorString)
    }
}
