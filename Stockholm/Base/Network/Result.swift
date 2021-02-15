//
//  Result.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

public enum Result<Value> {
    
    case success(Value)
    case failure(Error)
    
}
