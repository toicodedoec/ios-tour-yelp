//
//  BusinessViewCell.swift
//  Yelp
//
//  Created by john on 2/21/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessViewCell: UITableViewCell {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblNumOfReviews: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var imgRatedStars: UIImageView!
    
    var business: Business! {
        didSet {
            imgAvatar.setImageWith(business.imageURL!)
            lblNumOfReviews.text = (business.reviewCount?.stringValue)! + " Reviews"
            lblCategory.text = business.categories
            lblAddress.text = business.address
            lblName.text = business.name
            imgRatedStars.setImageWith(business.ratingImageURL!)
            lblDistance.text = business.distance
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgAvatar.layer.cornerRadius = 6.0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
