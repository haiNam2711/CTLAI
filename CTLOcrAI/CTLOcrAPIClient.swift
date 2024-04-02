//
//  CTLOcrAPICaller.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 08/03/2024.
//

import Foundation
import Alamofire

public class CTLOcrAPIClient {
    
    private var URL: String!
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    internal func setURL(URL: String) {
        self.URL = URL
    }
    
    
    /// Abstract Client function for Call API with parameter
    /// - Parameters:
    ///   - method: the API method
    ///   - path: the additional path after base path
    ///   - headers:
    ///   - params:
    ///   - notUseSnakeDecoder: true if you want to use available snake to camal JSON Decoder, false otherwise
    ///   - returnType: abstract Type conform Decodable
    ///   - completion:
    public func call<T>(_ method: HTTPMethod, path: String, headers: HTTPHeaders? = nil, params: [String: Any], notUseSnakeDecoder: Bool = false, returnType: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let encoder: ParameterEncoding = method == .post ? JSONEncoding.default : URLEncoding.default
        
        AF.request(URL + path, method: method, parameters: params, encoding: encoder, headers: headers)
//            .responseString { response in
//                print(response)
//            }
            .responseDecodable(of: T.self, decoder: notUseSnakeDecoder ? JSONDecoder() : decoder) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    
    /// Abstract Client function for Call API with Multipart Form Data
    /// - Parameters:
    ///   - method: the API method
    ///   - path: the additional path after base path
    ///   - headers:
    ///   - multipartFD:
    ///   - notUseSnakeDecoder: true if you want to use available snake to camal JSON Decoder, false otherwise
    ///   - returnType: abstract Type conform Decodable
    ///   - completion: 
    public func call<T>(_ method: HTTPMethod, path: String, headers: HTTPHeaders? = nil, multipartFD: MultipartFormData, notUseSnakeDecoder: Bool = false, returnType: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        AF.upload(multipartFormData: multipartFD, to: URL + path, headers: headers)
//            .responseString(completionHandler: { response in
//                print(response)
//            })
            .responseDecodable(of: T.self, decoder: notUseSnakeDecoder ? JSONDecoder() : decoder) { (response) in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }

    }
    
}
