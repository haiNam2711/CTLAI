//
//  CTLOcrSpeechUseCase.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 22/03/2024.
//

import Foundation
import Alamofire

public enum CTLOcrSpeechUseCase: CTLOcrUseCaseProtocol {

    case speechToText
    case textToSpeech
    case speechNormalization
    
    internal var URLPath: String {
        switch self {
        case .speechToText:
            return K.API.AdditionPath.Speech.speechToText
        case .textToSpeech:
            return K.API.AdditionPath.Speech.textToSpeech
        case .speechNormalization:
            return K.API.AdditionPath.Speech.speechNormalization
        }
    }
    
    internal var method: HTTPMethod {
        return .post
    }
    
}


