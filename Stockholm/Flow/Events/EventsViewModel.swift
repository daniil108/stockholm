//
//  EventsViewModel.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

class EventsViewModel: EventsViewOutput {
    
    // MARK: - Private Properties
    
    private let output: EventsModuleOutput
    
    // MARK: - Initialization
    
    init(output: EventsModuleOutput) {
        self.output = output
    }
    
    // MARK: - ArticlesViewOutput
    
//    var sections: ValueClosure<[SectionConfiguration]>?
    var scrollUp: EmptyClosure?
    var activityIndicator: ValueClosure<Bool>?
    
    func viewDidLoad() {
//        getArticles(for: currentPage)
    }
    
    func refresh() {
//        getArticles(for: currentPage)
    }
    
}

// MARK: - Private Methods

private extension EventsViewModel {
    
    func updateSections() {
        
    }
    
}
