//
//  BusinessDetailViewController.swift
//  Yelp
//
//  Created by john on 2/26/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessDetailViewController: UIViewController {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblReview: UILabel!
    @IBOutlet weak var imgStar: UIImageView!
    
    var businessDetail: Business!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imgAvatar.setImageWith(businessDetail.imageURL!)
        lblName.text = businessDetail.name
        lblAddress.text = businessDetail.address
        lblDistance.text = businessDetail.distance
        lblReview.text = (businessDetail.reviewCount?.stringValue)! + " Reviews"
        imgStar.setImageWith(businessDetail.ratingImageURL!)
        
        // Generate the tags of category information
        var tagX:CGFloat = imgStar.frame.origin.x
        var tagY:CGFloat = imgStar.frame.origin.y + imgStar.frame.size.height
        
        for cat in (businessDetail.categories?.components(separatedBy: ","))! {
            let view = UIView(frame: CGRect())
            
            let label = UILabel()
            label.text = Const.Tag_Symbol + cat
            label.font = label.font.withSize(10)
            label.textColor = UIColor.white
            label.sizeToFit()
            
            view.backgroundColor = UIColor.orange
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.darkGray.cgColor
            
            view.frame.size.width = label.frame.size.width + CGFloat(Const.Standard_Spacing)/2
            view.frame.size.height = CGFloat(Const.Standard_Height) - 10
            
            label.frame.origin.x = (view.frame.size.width - label.frame.size.width)/2
            label.frame.origin.y = (view.frame.size.height - label.frame.size.height)/2
            
            if tagX + view.frame.size.width + CGFloat(Const.Standard_Spacing) > UIScreen.main.bounds.width {
                tagX = CGFloat(Const.Standard_Spacing)
                tagY += view.frame.size.height + CGFloat(Const.Standard_Spacing)
            }
            
            view.frame.origin.x = tagX
            view.frame.origin.y = tagY + CGFloat(Const.Standard_Spacing)
            
            view.addSubview(label)
            self.view.addSubview(view)
            
            tagX += view.frame.size.width + CGFloat(Const.Standard_Spacing)/4
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mapVC = segue.destination as! BusinessMapViewController
        mapVC.selectedBusiness = self.businessDetail
    }
}
