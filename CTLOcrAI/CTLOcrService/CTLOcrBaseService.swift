//
//  CTLOcrBaseService.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 22/03/2024.
//

import Foundation
import Alamofire

public class CTLOcrBaseService {
    
    internal var baseClient: CTLOcrAPIClient!
    
    /// Abstract API Caller from Face Detect Use Case with Param or Form Data
    /// - Parameters:
    ///   - useCase: Face Detect Use Case
    ///   - params: Request Params
    ///   - multipartFormData: Request Form Data
    ///   - dataType: Abstract return Type
    internal func call<T:Decodable>(_ useCase: CTLOcrUseCaseProtocol, additionHeaders: HTTPHeaders? = nil, params: [String: Any]? = nil, multipartFormData: MultipartFormData? = nil, notUseSnakeDecoder: Bool = false, dataType: T.Type, completionHandler: @escaping (Result<T, CTLOcrAPIError>) -> Void) {
        
        if let errStr = handleToken() {
            completionHandler(.failure(.clientSideError("\(errStr)")))
            return
        }
        
        if let params {
            let jsonHeaders: HTTPHeaders = [
                K.API.Header.contentType: K.API.Header.json
            ]
            var headers: [String: String]
            if let additionHeaders {
                headers = jsonHeaders.dictionary.merging(additionHeaders.dictionary) { _, new in new }
            } else {
                headers = jsonHeaders.dictionary
            }
            baseClient.call(useCase.method, path: useCase.URLPath, headers: HTTPHeaders(headers), params: params, notUseSnakeDecoder: notUseSnakeDecoder, returnType: dataType) { response in
                switch response {
                case .success(let success):
                    completionHandler(.success(success))
                case .failure(let failure):
                    if failure.localizedDescription == K.Error.Description.RequestTimedOut {
                        completionHandler(.failure(.clientSideError(K.Error.ResponseDes.RequestTimedOut)))
                        return
                    }
                    completionHandler(.failure(.serverSideError(["message": "\(failure.localizedDescription)"])))
                }
            }
        } else if let multipartFormData {
            let jsonHeaders: HTTPHeaders = [
                K.API.Header.contentType: K.API.Header.multipartFD
            ]
            var headers: [String: String]
            if let additionHeaders {
                headers = jsonHeaders.dictionary.merging(additionHeaders.dictionary) { _, new in new }
            } else {
                headers = jsonHeaders.dictionary
            }

            baseClient.call(useCase.method, path: useCase.URLPath, headers: HTTPHeaders(headers), multipartFD: multipartFormData, notUseSnakeDecoder: notUseSnakeDecoder, returnType: dataType) { response in
                switch response {
                case .success(let success):
                    completionHandler(.success(success))
                case .failure(let failure):
                    completionHandler(.failure(.serverSideError(["message": "\(failure.localizedDescription)"])))
                }
            }
        }
    }
    
    private func handleToken() -> String? {
        if let expireDateString = CTLOcrKeychainHelper.get(dataOfKey: "expire") {
            let expireDate = Date(loginResponseString: expireDateString)
            let currentDate = Date()
            if expireDate <= currentDate {
                return K.Error.Description.expiredToken
            }
        } else {
            return K.Error.Description.expiredToken
        }
        return nil
    }
    
}
