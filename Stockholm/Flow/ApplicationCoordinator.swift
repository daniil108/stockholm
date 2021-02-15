//
//  ApplicationCoordinator.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    // MARK: - Private Properties
    
    private var window: UIWindow
    
    // MARK: - Initialization
    
    init(fromWindow: UIWindow) {
        self.window = fromWindow
        super.init(with: Router())
    }
    
    // MARK: - Internal Methods
    
    func start() {
        showEvents()
    }
    
}

// MARK: - Private Methods

private extension ApplicationCoordinator {
    
    func showEvents() {
        let vc = EventsModuleInitializer.initialize(output: self)
        let nc = NavigationController(rootViewController: vc)
        window.setRootViewController(nc)
    }
    
}

// MARK: - EventsModuleOutput, EventModuleOutput

extension ApplicationCoordinator: EventsModuleOutput, EventModuleOutput {
    
    func showError(_ error: Error) {
        router.showOKAlertView(nil, message: error.localizedDescription)
    }
    
    func onEvent(_ event: Event) {
        let vc = EventModuleInitializer.initialize(output: self, event: event)
        router.push(vc)
    }

}
