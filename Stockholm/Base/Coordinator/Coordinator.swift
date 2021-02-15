//
//  Coordinator.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

open class Coordinator: NSObject {
    
    let router: Router
    
    init(with router: Router) {
        self.router = router
    }
    
}
