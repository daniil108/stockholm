//
//  Route.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

enum Route {
    
    case events
    
    var url: URL? {
        switch self {
        case .events:
            return URL(string: "\(Urls.mainEndpoint)/v4/events")
        }
    }
    
    var request: URLRequest? {
        if let url = self.url {
            return URLRequest(url: url)
        }
        return nil
    }
    
}
