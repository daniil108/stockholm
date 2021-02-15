//
//  CustomError.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

final class CustomError: LocalizedError, Decodable {
    
    private let description: String
    
    // MARK: - LocalizedError
    
    var errorDescription: String? { return description }
    var failureReason: String? { return description }
    
    // MARK: - Decodable
    
    enum CodingKeys: String, CodingKey {
        case description = "error"
    }
    
    // MARK: - Initialization
    
    init(description: String) {
        self.description = description
    }
    
}

extension CustomError {
    
    static var parsingError: Error {
        return CustomError(description: R.string.localizable.errorParsing())
    }
    
}
