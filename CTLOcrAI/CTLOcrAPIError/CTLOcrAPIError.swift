//
//  CTLOcrAPIError.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 15/03/2024.
//

import Foundation
public enum CTLOcrAPIError: Error {
    case serverSideError([String: String])
    case clientSideError(String)
}

