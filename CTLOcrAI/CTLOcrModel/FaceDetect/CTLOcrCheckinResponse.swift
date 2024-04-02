//
//  CTLOcrShowCheckinResponse.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 19/03/2024.
//

import Foundation

public class CTLOcrShowCheckinResponse: Decodable {
    public var status: Int
    public var code: Int
    public var message: String
    public var data: [CTLOcrInfoResponse]
}

public class CTLOcrFilterCheckinResponse: Decodable {
    public var status: Int
    public var code: Int
    public var message: String
    public var total: Int
    public var data: [CTLOcrInfoResponse]
}

public class CTLOcrInfoResponse: Decodable {
    public var checkinTime: String
    public var email: String
    public var employeeCode: String
    public var link: String
    public var name: String
    public var probability: String
    public var imageID: String

    enum CodingKeys: String, CodingKey {
        case checkinTime = "info:checkin_time"
        case email = "info:email"
        case employeeCode = "info:employee_code"
        case link = "info:link"
        case name = "info:name"
        case probability = "info:probability"
        case imageID = "info:image_id"
    }
}
