//
//  CTLOcrUseCaseProtocol.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 22/03/2024.
//

import Foundation
import Alamofire

internal protocol CTLOcrUseCaseProtocol {
    
    var URLPath: String { get }
    var method: HTTPMethod { get }
    
}
