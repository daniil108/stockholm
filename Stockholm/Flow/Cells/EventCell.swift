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
    var height: CGFloat = 150
    
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
    @IBOutlet private weak var dateWeekLabel: UILabel!
    @IBOutlet private weak var dateNumberLabel: UILabel!
    @IBOutlet private weak var dateMonthLabel: UILabel!
    @IBOutlet private weak var dateHoursLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        topLabel.textColor = .black
        topLabel.font = .systemFont(ofSize: 17, weight: .black)
        topLabel.numberOfLines = 3
        
        bottomLabel.textColor = .black
        bottomLabel.font = .systemFont(ofSize: 11, weight: .regular)
        bottomLabel.numberOfLines = 3
        
        avatarImageView.contentMode = .scaleAspectFill
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 4
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.shadowOpacity = 0.1
        
        dateView.backgroundColor = UIColor.black.withAlphaComponent(0.03)
        
        dateWeekLabel.textAlignment = .center
        dateWeekLabel.textColor = .black
        dateWeekLabel.font = .systemFont(ofSize: 11, weight: .light)
        dateNumberLabel.textAlignment = .center
        dateNumberLabel.textColor = .black
        dateNumberLabel.font = .systemFont(ofSize: 17, weight: .black)
        dateMonthLabel.textAlignment = .center
        dateMonthLabel.textColor = .black
        dateMonthLabel.font = .systemFont(ofSize: 11, weight: .light)
        dateHoursLabel.textAlignment = .center
        dateHoursLabel.textColor = .black
        dateHoursLabel.font = .systemFont(ofSize: 11, weight: .light)
    }
    
    func configure(_ configuration: CellConfiguration) {
        guard let configuration = configuration as? EventCellConfiguration else { return }
        topLabel.text = configuration.title
        bottomLabel.text = configuration.description
        avatarImageView.kf.setImage(with: configuration.imageUrl)
        
        dateWeekLabel.text = configuration.startDate.dayOfTheWeek()?.uppercased()
        dateNumberLabel.text = configuration.startDate.dayNumber()
        dateMonthLabel.text = configuration.startDate.month()
        dateHoursLabel.text = "\(configuration.startDate.hoursAndMinutes() ?? "") - \(configuration.endDate.hoursAndMinutes() ?? "")"
    }
    
    
}
