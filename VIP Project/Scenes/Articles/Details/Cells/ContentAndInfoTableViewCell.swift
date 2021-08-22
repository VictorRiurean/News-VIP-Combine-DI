//
//  ContentAndInfoTableViewCell.swift
//  VIP Project
//
//  Created by Victor on 22/08/2021.
//

import UIKit

class ContentAndInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "contentAndInfoCellID"
    
    static func nib() -> UINib {
        return UINib(nibName: "ContentAndInfoTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
