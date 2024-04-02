//
//  test.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 18/03/2024.
//

import Foundation

protocol APIResource {
    associatedtype ModelType: Decodable
}

struct QuestionsResource: APIResource {
    typealias ModelType = CTLOcrLoginResponse
}
