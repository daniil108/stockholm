//
//  ReusableView.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit

public protocol ReusableView: class { }

public extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}
extension UITableViewHeaderFooterView: ReusableView {}
