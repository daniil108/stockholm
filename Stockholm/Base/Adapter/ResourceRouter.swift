//
//  ResourceRouter.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit

struct ResourceRouter {
    
    static func nib(forType anyClass: AnyClass, nibName: String? = nil) -> UINib {
        let nibName = nibName ?? String(describing: anyClass)
        return UINib(nibName: nibName, bundle: Bundle(for: anyClass))
    }
    
}
