//
//  NavigationController.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit

class NavigationController: UINavigationController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.backgroundColor = .white
        navigationBar.barTintColor = .white
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .black),
                          NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationBar.titleTextAttributes = attributes
    }
    
    var statusBarStyle: UIStatusBarStyle = .default {
        didSet { setNeedsStatusBarAppearanceUpdate() }
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
}
