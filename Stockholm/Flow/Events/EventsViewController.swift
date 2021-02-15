//
//  EventsViewController.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation
import UIKit

class EventsViewController: UIViewController {
    
    // MARK: - IBOutlets

    
    // MARK: - Private Properties
    
    private let viewModel: EventsViewOutput
//    private lazy var adapter = BaseTableViewAdapter(tableView)
    
    // MARK: - Initialization
    
    init(with viewOutput: EventsViewOutput) {
        self.viewModel = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.viewDidLoad()
    }

}

// MARK: - Private Methods

private extension EventsViewController {
    
    func setupUI() {
        view.backgroundColor = .white
    
    }
    
}

