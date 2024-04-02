//
//  CTLOcrGetUserResponse.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 22/03/2024.
//

import Foundation

public class CTLOcrGetUserResponse: Decodable {
    public var status: Int
    public var code: Int
    public var message: String
    public var data: CTLOcrUserInfoResponse
}

public class CTLOcrUserInfoResponse: Decodable {
    public var employeeCode: String
    public var name: String
    public var email: String
    public var registeredMask: Int
}

