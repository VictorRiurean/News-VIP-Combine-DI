//
//  ImageAndTitleTableViewCell.swift
//  VIP Project
//
//  Created by Victor on 22/08/2021.
//

import UIKit

class ImageAndTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "imageAndTitleCellID"
    
    static func nib() -> UINib {
        return UINib(nibName: "ImageAndTitleTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bringSubviewToFront(titleView)
        titleView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
