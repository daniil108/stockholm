//
//  EventsModuleIntitializer.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

protocol EventsModuleOutput: class {
    
    func showError(_ error: Error)
    
}

protocol EventsViewOutput: class {

//    var sections: ValueClosure<[SectionConfiguration]>? { get set }
    var scrollUp: EmptyClosure? { get set }
    var activityIndicator: ValueClosure<Bool>? { get set }
    
    func viewDidLoad()
    func refresh()
    
}

final class EventsModuleInitializer {
    
    static func initialize(output: EventsModuleOutput) -> EventsViewController {
        let viewModel = EventsViewModel(
            output: output
        )
        return EventsViewController(with: viewModel)
    }
    
}
