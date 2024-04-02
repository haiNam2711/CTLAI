//
//  CTLOcrRegisterResponse.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 18/03/2024.
//

import Foundation

public class CTLOcrBaseResponse: Decodable {
    public var message: String
    public var code: Int
    public var status: Int
}
