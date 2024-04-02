//
//  CTLOcrUseCase.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 26/03/2024.
//

import Foundation
import Alamofire

public enum CTLOcrUseCase: CTLOcrUseCaseProtocol {

    case cmtGet
    case cmtPost
    case bhytGet
    case bhytPost
    
    internal var URLPath: String {
        switch self {
        case .cmtGet, .cmtPost:
            return K.API.AdditionPath.Ocr.cmt
        case .bhytGet, .bhytPost:
            return K.API.AdditionPath.Ocr.bhyt
        }
    }
    
    internal var method: HTTPMethod {
        switch self {
        case .cmtGet, .bhytGet:
            return .get
        case .cmtPost, .bhytPost:
            return .post
        }
    }
    
}
