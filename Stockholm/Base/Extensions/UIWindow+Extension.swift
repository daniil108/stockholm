//
//  UIWindow+Extension.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit

extension UIWindow {
    
    public func setRootViewController(_ viewController: UIViewController, animated: Bool = true) {
        if animated {
            UIView.transition(with: self, duration: 0.3, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: { () -> Void in
                self.rootViewController = viewController
            }, completion: nil)
        } else {
            self.rootViewController = viewController
        }
    }
    
}
