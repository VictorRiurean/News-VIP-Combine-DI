//
//  ArticleTableViewCell.swift
//  VIP Project
//
//  Created by Victor on 22/08/2021.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "articlesCellID"
    
    static func nib() -> UINib {
        return UINib(nibName: "ArticleTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = Colors.myLightGray
        
        cellView.layer.masksToBounds = false
        cellView.layer.shadowOpacity = 0.13
        cellView.layer.shadowRadius = 4
        cellView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.cornerRadius = 8
        
        titleLabel.sizeToFit()
        titleLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(url: URL, processor: DownsamplingImageProcessor, title: String) {
        iconImageView.kf.indicatorType = .activity
        iconImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        iconImageView.layer.cornerRadius = 5
        iconImageView.layer.masksToBounds = true
        titleLabel.text = title
    }
    
}
