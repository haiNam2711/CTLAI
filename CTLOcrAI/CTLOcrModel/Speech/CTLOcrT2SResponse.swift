//
//  CTLOcrT2SResponse.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 25/03/2024.
//

import Foundation
public class CTLOcrT2SResponse: Decodable {
    public var status: Int
    public var code: Int
    public var message: String
    public var data: CTLOcrT2SData
}

public class CTLOcrT2SData: Decodable {
    public var filePath: String
}
