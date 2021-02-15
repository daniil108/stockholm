//
//  Router.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit

class Router {
    
    private weak var controller: UIViewController?
    
    init(with controller: UIViewController? = nil){
        self.controller = controller
    }
    
    var topMostViewController: UIViewController? {
        if let controller = controller {
            return topViewController(controller)
        } else {
            return topViewController()
        }
    }
    
    func push(_ viewController: UIViewController, animated: Bool = true) {
        topMostViewController?.navigationController?.pushViewController(viewController, animated: animated)
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        topMostViewController?.dismiss(animated: animated, completion: completion)
    }
    
    func topViewController(_ controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let navigationController = controller as? UINavigationController {
            return topViewController(navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(presented)
        }
        return controller
    }
    
}
