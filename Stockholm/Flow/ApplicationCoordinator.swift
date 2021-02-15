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

// MARK: - ArticlesModuleOutput, ArticleModuleOutput

extension ApplicationCoordinator: EventsModuleOutput {
    
    func showError(_ error: Error) {
        router.showOKAlertView(nil, message: error.localizedDescription)
    }

}
