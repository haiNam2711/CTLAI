//
//  CTLOcrBaseResponse.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 18/03/2024.
//

import Foundation

public class CTLOcrLoginResponse: Decodable {
    internal var message: CTLOcrMessage
    public var code: Int
    public var status: Int
    public var data: CTLOcrLoginDataResponse?
    
    public lazy var finalMessage: [String: String] = {
        switch message {
        case .string(let string):
            return ["message": string]
        case .dictionary(let dictionary):
            return dictionary
        }
    }()
}

public class CTLOcrLoginDataResponse: Decodable {
    public var expireData: String
    public var jwtToken: String
}

public enum CTLOcrMessage: Decodable {
    case string(String)
    case dictionary([String: String])
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
        } else if let x = try? container.decode([String: String].self) {
            self = .dictionary(x)
        } else {
            throw DecodingError.typeMismatch(CTLOcrMessage.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for MyValue"))
        }
    }
}
