//
//  CellConfiguration.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit

public protocol CellConfiguration: AnyObject {
    
    var viewType: ConfigurableCell.Type { get }
    var height: CGFloat { get }
    
}

public extension CellConfiguration {
    
    var height: CGFloat { return UITableView.automaticDimension }
    
}

public protocol ConfigurableCell where Self: UITableViewCell {
    
    func configure(_ configuration: CellConfiguration)
    
}
