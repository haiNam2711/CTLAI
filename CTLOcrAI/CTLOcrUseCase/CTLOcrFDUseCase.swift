//
//  CTLOcrFDUseCase.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 18/03/2024.
//

import Foundation
import Alamofire

public enum CTLOcrFaceDetectUseCase: CTLOcrUseCaseProtocol {
    
    case registerFace
    case predictFace
    case showCheckin
    case filterCheckin
    case getInfo
    case updateInfo
    case fasPredict
    case compareFace
    
    internal var URLPath: String {
        switch self {
        case .registerFace:
            return K.API.AdditionPath.FD.registerFace
        case .predictFace:
            return K.API.AdditionPath.FD.predictFace
        case .showCheckin:
            return K.API.AdditionPath.FD.showCheckin
        case .filterCheckin:
            return K.API.AdditionPath.FD.filterCheckin
        case .getInfo:
            return K.API.AdditionPath.FD.getInfo
        case .updateInfo:
            return K.API.AdditionPath.FD.updateInfo
        case .fasPredict:
            return K.API.AdditionPath.FD.fasPredict
        case .compareFace:
            return K.API.AdditionPath.FD.compareFace
        }
    }
    
    internal var method: HTTPMethod {
        return .post
    }
    
}


