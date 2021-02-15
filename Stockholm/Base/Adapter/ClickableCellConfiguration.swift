//
//  ClickableCellConfiguration.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit

public protocol ClickableCellConfiguration where Self: CellConfiguration {
    
    var onClicked: (() -> Void)? { get set }
    
}
