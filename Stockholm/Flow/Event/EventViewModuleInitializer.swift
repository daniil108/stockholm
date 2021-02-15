//
//  EventViewModuleInitializer.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

protocol EventModuleOutput: class {
    
}

protocol EventViewOutput: class {

    var title: String { get }
    var image: URL? { get }
    var description: String { get }
    
}

final class EventModuleInitializer {
    
    static func initialize(output: EventModuleOutput, event: Event) -> EventViewController {
        let viewModel = EventViewModel(
            output: output,
            event: event
        )
        return EventViewController(with: viewModel)
    }
    
}
