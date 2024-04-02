//
//  CTLOcrS2TResponse.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 22/03/2024.
//

import Foundation

public class CTLOcrS2TResponse: Decodable {
    public var message: String
    public var code: Int
    public var status: Int
    public var data: CTLOcrData
}

public class CTLOcrData: Decodable {
    public var modelVersion: String
    public var result: CTLOcrResult
}

public class CTLOcrResult: Decodable {
    public var duration: String
    public var inferTime: String
    public var text: [CTLOcrText]
}

public class CTLOcrText: Decodable {
    public var start: String
    public var text: String
    internal var segments: [[CTLOcrSeg]]
    
    public var returnSegment: [CTLOcrISegment] {
        var res: [CTLOcrISegment] = []
        for seg in segments {
            var start, stop: Double!
            var tex: String!
            if case .index(let ind) = seg[0] {
                start = ind
            }
            if case .index(let ind) = seg[1] {
                stop = ind
            }
            if case .iText(let text) = seg[2] {
                tex = text
            }
            res.append(CTLOcrISegment(start: start, stop: stop, text: tex))
        }
        return res
    }
}

public enum CTLOcrSeg: Decodable {
    case index(Double)
    case iText(String)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .index(x)
        } else if let x = try? container.decode(String.self) {
            self = .iText(x)
        } else {
            throw DecodingError.typeMismatch(CTLOcrMessage.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for MyValue"))
        }
    }
}

public struct CTLOcrISegment {
    public var start: Double
    public var stop: Double
    public var text: String
}
