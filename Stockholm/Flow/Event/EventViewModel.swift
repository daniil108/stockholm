//
//  EventViewModel.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

class EventViewModel: EventViewOutput {
    
    // MARK: - Private Properties
    
    private let output: EventModuleOutput
    private let event: Event
    
    // MARK: - Initialization
    
    init(output: EventModuleOutput, event: Event) {
        self.output = output
        self.event = event
    }
    
    // MARK: - EventViewOutput

    var title: String {
        event.name
    }
    
    var image: URL? {
        if let imagePath = event.images.first {
            return URL(string: "\(Urls.imagesCloud)\(imagePath)")
        } else {
            return nil
        }
    }
    
    var description: String {
        event.description
    }
    
}
