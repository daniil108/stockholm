//
//  EventCell.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit
import Kingfisher

class EventCellConfiguration: CellConfiguration, ClickableCellConfiguration {
   
    var viewType: ConfigurableCell.Type { EventCell.self }
    
    var onClicked: (() -> Void)?
    var height: CGFloat = 100
    
    let title: String
    let description: String
    let imageUrl: URL?
    let startDate: Date
    let endDate: Date

    init(title: String,
         description: String,
         imageUrl: URL?,
         startDate: Date,
         endDate: Date,
         onClicked: (() -> Void)?) {
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
        self.startDate = startDate
        self.endDate = endDate
        self.onClicked = onClicked
    }
    
}

class EventCell: UITableViewCell, ConfigurableCell {
    
    @IBOutlet private weak var shadowView: UIView!
    @IBOutlet private weak var topLabel: UILabel!
    @IBOutlet private weak var bottomLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var dateView: UIView!
    @IBOutlet private weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topLabel.textColor = .black
    }
    
    func configure(_ configuration: CellConfiguration) {
        guard let configuration = configuration as? EventCellConfiguration else { return }
        topLabel.text = configuration.title
        bottomLabel.text = configuration.description
        dateLabel.text = configuration.startDate.description
        avatarImageView.kf.setImage(with: configuration.imageUrl)
    }
    
    
}
