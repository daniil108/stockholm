//
//  Event.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

struct Event: Codable {
    
    let venueId: Int
    let name: String
    let description: String
    let startTime: Date
    let endTime: Date
    let images: [String]
    
}
