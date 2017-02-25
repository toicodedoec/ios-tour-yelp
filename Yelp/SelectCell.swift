//
//  SelectCell.swift
//  Yelp
//
//  Created by john on 2/25/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

class SelectCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgStatus:  UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgStatus.isHidden = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
