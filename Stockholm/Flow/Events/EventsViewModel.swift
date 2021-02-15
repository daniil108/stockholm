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
    private var events: Events?
    
    // MARK: - Initialization
    
    init(output: EventsModuleOutput, eventsInteractor: EventsInteractor) {
        self.output = output
        self.eventsInteractor = eventsInteractor
    }
    
    // MARK: - ArticlesViewOutput
    
    var sections: ValueClosure<[SectionConfiguration]>?
    var scrollUp: EmptyClosure?
    var activityIndicator: ValueClosure<Bool>?
    
    func viewDidLoad() {
        getEvents()
    }
    
    func refresh() {
        getEvents()
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
                self?.events = events
                self?.updateSections()
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.output.showError(error)
                }
            }
        }
    }
    
    func updateSections() {
        guard let events = events else { return }
        var cells: [CellConfiguration] = []
        for event in events.events {
            let vanueName = events.venues.first(where: { $0.venueId == event.venueId })?.venueName ?? ""
            cells.append(EventCellConfiguration(title: event.name,
                                                description: vanueName,
                                                imageUrl: nil,
                                                date: "Same date") { [weak self] in
                                                    
                                                })
        }
        sections?([BaseSectionConfiguration(rows: cells)])
    }
    
}
