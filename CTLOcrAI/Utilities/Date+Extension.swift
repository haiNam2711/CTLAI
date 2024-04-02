//
//  Date+Extension.swift
//  CTLOcrAI
//
//  Created by Hai Nam on 22/03/2024.
//

import Foundation
extension Date {
    public init(loginResponseString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        let date = dateFormatter.date(from: loginResponseString)
        self = date ?? Date.now
    }
}
