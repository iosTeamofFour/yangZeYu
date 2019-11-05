//
//  foodTableViewCell.swift
//  Homework3
//
//  Created by Apple on 2019/10/29.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class foodTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
