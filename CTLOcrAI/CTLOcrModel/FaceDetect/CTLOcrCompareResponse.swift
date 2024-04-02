//
//  CTLOcrCompareResponse.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 22/03/2024.
//

import Foundation
public class CTLOcrCompareResponse: Decodable {
    public var status: Int
    public var code: Int
    public var message: String
    public var data: CTLOcrCompareData
}

public class CTLOcrCompareData: Decodable {
    public var similarity: String
}
