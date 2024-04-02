//
//  CTLOcrBhytResponse.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 28/03/2024.
//

import Foundation

public class CTLOcrBhytResponse: Decodable {
    public var data: CTLOcrBhytData
}

public class CTLOcrBhytData: Decodable {
    public var results: [CTLOcrBhytResult]
}


public class CTLOcrBhytResult: Decodable {
    public var key: String
    public var value: String
}
