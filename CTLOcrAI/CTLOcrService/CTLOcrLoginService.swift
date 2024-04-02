//
//  CTLOcrLoginService.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 18/03/2024.
//

import Foundation
import Alamofire
import KeychainSwift

public class CTLOcrLoginService {
    
    private var baseClient: CTLOcrAPIClient!
    
    public init() {
        self.baseClient = CTLOcrAPIClient()
        baseClient.setURL(URL: K.API.Domain.login)
    }
    
    public func logIn(email: String, password: String, expire: Int = 1, completionHandler: @escaping (Result<CTLOcrLoginResponse, CTLOcrAPIError>) -> Void ) {
        let headers: HTTPHeaders = [
            K.API.Header.contentType: K.API.Header.json
        ]
        let params: [String : Any] = [
            "email": email,
            "password": password,
            "expire": expire
        ]
        baseClient.call(.post, path: K.API.AdditionPath.login, headers: headers, params: params, returnType: CTLOcrLoginResponse.self) { response in
            switch response {
            case .success(let data):
                if case .dictionary((let dict)) = data.message {
                    let error = CTLOcrAPIError.serverSideError(dict)
                    completionHandler(.failure(error))
                } else {
                    if let token = data.data?.jwtToken {
                        let _ = KeychainSwift().set(token, forKey: "token")
                    }
                    if let expire = data.data?.expireData {
                        let _ = KeychainSwift().set(expire, forKey: "expire")
                    }
                    completionHandler(.success(data))
                }
            case .failure(let error):
                completionHandler(.failure(.clientSideError(error.localizedDescription)))
            }
        }
    }
    
}
