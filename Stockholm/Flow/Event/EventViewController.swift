//
//  EventViewController.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit
import Kingfisher

class EventViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Private Properties
    
    private let viewModel: EventViewOutput
    
    // MARK: - Initialization
    
    init(with viewOutput: EventViewOutput) {
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
    }

}

// MARK: - Private Methods

private extension EventViewController {
    
    func setupUI() {
        title = viewModel.title
        view.backgroundColor = .white
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.kf.setImage(with: viewModel.image)
        descriptionLabel.text = viewModel.description
        descriptionLabel.font = .systemFont(ofSize: 17, weight: .regular)
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0
    }
    
}

