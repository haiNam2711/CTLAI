//
//  CTLOcrFDService.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 18/03/2024.
//

import Foundation
import UIKit
import Alamofire

public class CTLOcrFDService: CTLOcrBaseService {
    
    public override init() {
        super.init()
        baseClient = CTLOcrAPIClient()
        baseClient.setURL(URL: K.API.Domain.FD)
    }
    
    /// Call API to register Face
    /// - Parameters:
    ///   - faceImage: the UIImage represent the face of user
    ///   - name: name of user
    ///   - email: email of user
    ///   - employeeCode: employee code of user
    ///   - isFaceMasked: 0 is not masked face, 1 is masked face
    ///   - completionHandler:
    public func registerFace(_ faceImage: UIImage, name: String, email: String, employeeCode: Int, isFaceMasked: Int, completionHandler: @escaping (Result<CTLOcrLoginResponse, CTLOcrAPIError>) -> Void) {
        
        guard let jpegFaceImage = faceImage.jpegData(compressionQuality: 1.0) else { return }
        let params: [String : Any] = [
            "name": name,
            "email": email,
            "employee_code": employeeCode,
            "face_mask": isFaceMasked
        ]
        let multipartFD = MultipartFormData()
        multipartFD.append(jpegFaceImage, withName: "image", fileName: "man.jpeg", mimeType: "image/jpeg")
        for (key, value) in params {
            multipartFD.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
        }
        
        call(CTLOcrFaceDetectUseCase.registerFace, multipartFormData: multipartFD, dataType: CTLOcrLoginResponse.self) { response in
            completionHandler(response)
        }
    }
    
    
    /// get the checkin history of all company
    /// - Parameters:
    ///   - numberRecord: number of record you want to get, it has to be > 2
    ///   - completionHandler:
    public func getCheckinHistory(numberRecord: Int, completionHandler: @escaping (Result<CTLOcrShowCheckinResponse, CTLOcrAPIError>) -> Void) {
        let params: [String : Any] = [
            "number_record": numberRecord
        ]
        call(CTLOcrFaceDetectUseCase.showCheckin, params: params, notUseSnakeDecoder: true, dataType: CTLOcrShowCheckinResponse.self) { response in
            completionHandler(response)
        }
    }
    
    public func filterCheckinHistory(employeeCode: Int, fromDate: Int, toDate: Int, listEmail: [String], check: Int, page: Int, limit: Int, completionHandler: @escaping (Result<CTLOcrFilterCheckinResponse, CTLOcrAPIError>) -> Void) {
        let params: [String : Any] = [
            "employee_code": employeeCode,
            "from_date": fromDate,
            "to_date": toDate,
            "list_email": listEmail,
            "check": check,
            "page": page,
            "limit": limit
        ]
        call(CTLOcrFaceDetectUseCase.filterCheckin, params: params, notUseSnakeDecoder: true, dataType: CTLOcrFilterCheckinResponse.self) { response in
            completionHandler(response)
        }
    }
    
    public func getUserInfo(email: String, completionHandler: @escaping (Result<CTLOcrGetUserResponse, CTLOcrAPIError>) -> Void) {
        let params: [String : Any] = [
            "email": email
        ]
        let multipartFD = MultipartFormData()
        for (key, value) in params {
            multipartFD.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
        }
        call(CTLOcrFaceDetectUseCase.getInfo, multipartFormData: multipartFD, dataType: CTLOcrGetUserResponse.self) { response in
            completionHandler(response)
        }
    }
    
    public func changeUserInfo(email: String, employeeCode: Int, name: String, completionHandler: @escaping (Result<CTLOcrBaseResponse, CTLOcrAPIError>) -> Void) {
        let params: [String : Any] = [
            "email": email,
            "employee_code": employeeCode,
            "name": name
        ]
        call(CTLOcrFaceDetectUseCase.updateInfo, params: params, dataType: CTLOcrBaseResponse.self) { response in
            completionHandler(response)
        }
    }
    
    public func predictFake(_ image: UIImage, completionHandler: @escaping (Result<CTLOcrBaseResponse, CTLOcrAPIError>) -> Void) {
        
        guard let jpegImage = image.jpegData(compressionQuality: 1.0) else { return }
        let multipartFD = MultipartFormData()
        multipartFD.append(jpegImage, withName: "image", fileName: "man.jpeg", mimeType: "image/jpeg")
        
        call(CTLOcrFaceDetectUseCase.fasPredict, multipartFormData: multipartFD, dataType: CTLOcrBaseResponse.self) { response in
            completionHandler(response)
        }
    }
    
    public func compareFaces(image1: UIImage, image2: UIImage, completionHandler: @escaping (Result<CTLOcrCompareResponse, CTLOcrAPIError>) -> Void) {
        guard let jpegImage1 = image1.jpegData(compressionQuality: 1.0) else { return }
        guard let jpegImage2 = image2.jpegData(compressionQuality: 1.0) else { return }
        let multipartFD = MultipartFormData()
        multipartFD.append(jpegImage1, withName: "image1", fileName: "man1.jpeg", mimeType: "image/jpeg")
        multipartFD.append(jpegImage2, withName: "image2", fileName: "man2.jpeg", mimeType: "image/jpeg")
        
        call(CTLOcrFaceDetectUseCase.compareFace, multipartFormData: multipartFD, dataType: CTLOcrCompareResponse.self) { response in
            completionHandler(response)
        }

    }

}

