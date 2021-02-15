//
//  EventsInteractor.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

class EventsInteractor {
    
    private let queue: DispatchQueue
    
    init(with queue: DispatchQueue) {
        self.queue = queue
    }
    
    func getEvents(completion: @escaping ValueClosure<Result<Events>>) {
        queue.async {
            APIClient.getRequest(route: .events, completion)
        }
    }
    
}
