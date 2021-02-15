//
//  DateDecodingStrategy+Extension.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

private enum PossibleServerFormats: String, CaseIterable {
    
    case iso8601full = "yyyy-MM-dd'T'HH:mm:ssZZZZZZ"
    
}

extension JSONDecoder.DateDecodingStrategy {
    
    static let iso8601custom: JSONDecoder.DateDecodingStrategy = {
        return .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.timeZone = TimeZone(identifier: "UTC")
            formatter.locale = Locale(identifier: "en_US_POSIX")
            
            for format in PossibleServerFormats.allCases {
                formatter.dateFormat = format.rawValue
                if let date = formatter.date(from: dateString) {
                    return date
                }
            }

            throw CustomError.parsingError
        }
    }()
    
}
