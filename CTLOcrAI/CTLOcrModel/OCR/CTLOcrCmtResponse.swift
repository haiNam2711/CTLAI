//
//  CTLOcrCmtResponse.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 26/03/2024.
//

import Foundation

public class CTLOcrCmtResponse: Decodable {
    public var code: Int
    public var message: String
    public var status: Int
    public var data: CTLOcrCmtData
}

public class CTLOcrCmtData: Decodable {
    public var results: [CTLOcrCmtResult]
}

public class CTLOcrCmtResult: Decodable {
    public var key: String
    public var value: String
}
