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
    private let eventsInteractor: EventsInteractor
    
    // MARK: - Initialization
    
    init(output: EventsModuleOutput, eventsInteractor: EventsInteractor) {
        self.output = output
        self.eventsInteractor = eventsInteractor
    }
    
    // MARK: - ArticlesViewOutput
    
//    var sections: ValueClosure<[SectionConfiguration]>?
    var scrollUp: EmptyClosure?
    var activityIndicator: ValueClosure<Bool>?
    
    func viewDidLoad() {
//        getArticles(for: currentPage)
        getEvents()
    }
    
    func refresh() {
//        getArticles(for: currentPage)
    }
    
}

// MARK: - Private Methods

private extension EventsViewModel {
    
    func getEvents() {
        activityIndicator?(true)
        eventsInteractor.getEvents { [weak self] result in
            self?.activityIndicator?(false)
            switch result {
            case .success(let events):
                print(events)
                break
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.output.showError(error)
                }
            }
        }
    }
    
    func updateSections() {
        
    }
    
}
