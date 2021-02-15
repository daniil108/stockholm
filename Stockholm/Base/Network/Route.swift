//
//  Route.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

enum Route {
    
    case events(size: Int, page: Int)
    
    var url: URL? {
        switch self {
        case .events(let size, let page):
            return URL(string: "\(Urls.mainEndpoint)/v4/events?pageSize=\(size)&pageNumber=\(page)")
        }
    }
    
    var request: URLRequest? {
        if let url = self.url {
            return URLRequest(url: url)
        }
        return nil
    }
    
}
