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

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loadingView: UIView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Private Properties
    
    private let viewModel: EventsViewOutput
    private lazy var adapter = BaseTableViewAdapter(tableView)
    
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
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(EventCell.self)
        loadingView.isHidden = true
        
        adapter.didRefresh = { [weak self] in
            self?.viewModel.refresh()
        }
    
        viewModel.sections = { [weak self] sections in
            DispatchQueue.main.async {
                self?.adapter.reloadWith(descriptors: sections)
            }
        }
        
        viewModel.activityIndicator = { [weak self] show in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                if show && !self.adapter.isRefreshing {
                    self.activityIndicator.startAnimating()
                    self.loadingView.isHidden = false
                }
                if !show {
                    self.activityIndicator.stopAnimating()
                    self.loadingView.isHidden = true
                    self.adapter.stopRefreshing()
                }
            }
        }
    }
    
}

