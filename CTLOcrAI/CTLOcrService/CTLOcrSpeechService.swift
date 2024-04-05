//
//  CTLOcrSpeechService.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 22/03/2024.
//

import Foundation
import Alamofire

public class CTLOcrSpeechService: CTLOcrBaseService {
    
    public override init() {
        super.init()
        baseClient = CTLOcrAPIClient()
        baseClient.setURL(URL: K.API.Domain.Speech)
    }
    
    public func speechToText(from file: String, completionHandler: @escaping (Result<CTLOcrS2TResponse, CTLOcrAPIError>) -> Void) {
        let params: [String: String] = [
            "file": file
        ]
        
        let headers: HTTPHeaders? = [
            "Authorization": CTLOcrKeychainHelper.get(dataOfKey: "token")!
        ]
        
        call(CTLOcrSpeechUseCase.speechToText,additionHeaders: headers, params: params, dataType: CTLOcrS2TResponse.self) { response in
            completionHandler(response)
        }
    }
    
    public func speechToText(from localURL: URL, completionHandler: @escaping (Result<CTLOcrS2TResponse, CTLOcrAPIError>) -> Void) {
        let headers: HTTPHeaders? = [
            "Authorization": CTLOcrKeychainHelper.get(dataOfKey: "token")!
        ]
        let multipartFD = MultipartFormData()
        multipartFD.append(localURL, withName: "file")
        
        call(CTLOcrSpeechUseCase.speechToText,additionHeaders: headers, multipartFormData: multipartFD, dataType: CTLOcrS2TResponse.self) { response in
            completionHandler(response)
        }
    }
    
    public func textToSpeech(from file: String, completionHandler: @escaping (Result<CTLOcrT2SResponse, CTLOcrAPIError>) -> Void) {
        let params: [String: String] = [
            "text": file
        ]
        let headers: HTTPHeaders? = [
            "Authorization": CTLOcrKeychainHelper.get(dataOfKey: "token")!
        ]
        guard let headers else { return }
        call(CTLOcrSpeechUseCase.textToSpeech,additionHeaders: headers, params: params, dataType: CTLOcrT2SResponse.self) { response in
            completionHandler(response)
        }
    }
    
}
