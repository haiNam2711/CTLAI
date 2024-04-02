//
//  Constant.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 29/03/2024.
//

import Foundation

struct K {
    
    struct Error {
        struct Description {
            static var RequestTimedOut = "URLSessionTask failed with error: The request timed out."
            static var expiredToken = "Expired token"
        }
        struct ResponseDes {
            static var RequestTimedOut = "Request Timed Out. Check for Internet Connection"
        }
    }
    
    struct API {
        struct Header {
            static var contentType = "Content-Type"
            static var json = "application/json"
            static var multipartFD = "multipart/form-data; boundary=<calculated when request is sent>"
        }
        
        struct Domain {
            static var login = "https://computervision.aiservice.vn/"
            static var FD = "https://computervision.admicro.vn/"
            static var Speech = "https://speech.aiservice.vn/"
            static var Ocr = "https://computervision.aiservice.vn/"
        }
        
        struct AdditionPath {
            static var login = "v2/user/generate_token"
            
            struct FD {
                static var registerFace = "ai/face/register"
                static var predictFace = "ai/face/predict"
                static var showCheckin = "ai/face/show_checkin_history"
                static var filterCheckin = "ai/face/filter"
                static var getInfo = "ai/face/get_info"
                static var updateInfo = "ai/face/update_info"
                static var fasPredict = "ai/face/fas_predict"
                static var compareFace = "ai/face/compare"
            }
            
            struct Speech {
                static var speechToText = "api/v1/speechtotext"
                static var textToSpeech = "tts/api/v1/synthesis"
                static var speechNormalization = "tts-normalization"
            }
            
            struct Ocr {
                static var cmt = "v2/cmt"
                static var bhyt = "v2/bhyt"
            }
        }
    }
    
}
