//
//  UITableView+Extension.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        register(UINib(nibName: cellType.reuseIdentifier, bundle: nil), forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
}
