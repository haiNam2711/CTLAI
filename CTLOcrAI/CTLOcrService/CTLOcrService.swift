//
//  CTLOcrService.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 26/03/2024.
//

import Foundation
import Alamofire
import KeychainSwift

public class CTLOcrService: CTLOcrBaseService {
    
    public override init() {
        super.init()
        baseClient = CTLOcrAPIClient()
        baseClient.setURL(URL: K.API.Domain.Ocr)
    }
    
    public func getCmtInfo(link: String, completionHandler: @escaping (Result<CTLOcrCmtResponse, CTLOcrAPIError>) -> Void) {
        let params: [String: String] = [
            "link": link
        ]
        let headers: HTTPHeaders? = [
            "Authorization": "Bearer \(KeychainSwift().get("token")!)"
        ]
        
        call(CTLOcrUseCase.cmtGet,additionHeaders: headers, params: params, dataType: CTLOcrCmtResponse.self) { response in
            completionHandler(response)
        }
    }
    
    public func getCmtInfo(image: UIImage, completionHandler: @escaping (Result<CTLOcrCmtResponse, CTLOcrAPIError>) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": KeychainSwift().get("token")!
        ]
        
        guard let jpegImage = image.jpegData(compressionQuality: 1.0) else { return }
        let multipartFD = MultipartFormData()
        multipartFD.append(jpegImage, withName: "image", fileName: "cmt.jpeg", mimeType: "image/jpeg")
        
        call(CTLOcrUseCase.cmtPost, additionHeaders: headers, multipartFormData: multipartFD, dataType: CTLOcrCmtResponse.self) { response in
            completionHandler(response)
        }
    }
    
    public func getBhytInfo(link: String, completionHandler: @escaping (Result<CTLOcrBhytResponse, CTLOcrAPIError>) -> Void) {
        let params: [String: String] = [
            "link": link
        ]
        let headers: HTTPHeaders? = [
            "Authorization": "Bearer \(KeychainSwift().get("token")!)"
        ]
        
        call(CTLOcrUseCase.bhytGet,additionHeaders: headers, params: params, dataType: CTLOcrBhytResponse.self) { response in
            completionHandler(response)
        }
    }
    
    public func getBhytInfo(image: UIImage, completionHandler: @escaping (Result<CTLOcrBhytResponse, CTLOcrAPIError>) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": KeychainSwift().get("token")!
        ]
        
        guard let jpegImage = image.jpegData(compressionQuality: 1.0) else { return }
        let multipartFD = MultipartFormData()
        multipartFD.append(jpegImage, withName: "image", fileName: "cmt.jpeg", mimeType: "image/jpeg")
        
        call(CTLOcrUseCase.cmtPost, additionHeaders: headers, multipartFormData: multipartFD, dataType: CTLOcrBhytResponse.self) { response in
            completionHandler(response)
        }
    }
    
}
