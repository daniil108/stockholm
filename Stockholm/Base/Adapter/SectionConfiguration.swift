//
//  SectionConfiguration.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

public protocol SectionConfiguration: AnyObject {
    
    var rows: [CellConfiguration] { get set }
    
}

public class BaseSectionConfiguration: SectionConfiguration {
    
    public var rows: [CellConfiguration]
    
    public init(rows: [CellConfiguration] = []) {
        self.rows = rows
    }
    
}
