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
        
        var x = imgStar.frame.origin.x
        let y = imgStar.frame.origin.y + imgStar.frame.size.height + 10
        for cat in (businessDetail.categories?.components(separatedBy: ","))! {
            let view = UIView(frame: CGRect(x: 10, y: 300, width: cat.characters.count * 10, height: 30))
            view.frame.origin.x = x
            view.frame.origin.y = y
            
            let label = UILabel()
            label.text = "ℹ️️" + cat
            label.font = label.font.withSize(15)
            label.textColor = UIColor.white
            label.sizeToFit()
            
            view.frame.size.width = label.frame.size.width + 10
            view.backgroundColor = UIColor.orange
            
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.darkGray.cgColor
            
            label.frame.origin.x = (view.frame.size.width - label.frame.size.width)/2
            label.frame.origin.y = (view.frame.size.height - label.frame.size.height)/2
            
            view.addSubview(label)
            self.view.addSubview(view)
            
            x += view.frame.size.width + 5
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
