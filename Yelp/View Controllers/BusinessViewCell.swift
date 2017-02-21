//
//  BusinessViewCell.swift
//  Yelp
//
//  Created by john on 2/21/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

class BusinessViewCell: UITableViewCell {
    
    var business: Business! {
        didSet {
            
        }
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
