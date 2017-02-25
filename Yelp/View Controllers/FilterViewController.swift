//
//  FilterViewController.swift
//  Yelp
//
//  Created by john on 2/24/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet weak var tblSetting: UITableView!
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var showAllCategories: Bool = false
    var showAllDistances: Bool = false
    var showAllSortConditions: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tblSetting.dataSource = self
        tblSetting.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension FilterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch (indexPath as NSIndexPath).section {
        case 0: return 40
        case 1: return indexPath.row > 0 ? (!showAllDistances ? 0 : 40) : 40
        case 2: return indexPath.row > 0 ? (!showAllSortConditions ? 0 : 40) : 40
        case 3: return indexPath.row > 5 ? (!showAllCategories ? 0 : 40) : 40
        default: return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 5
        case 2: return 5
        case 3: return 10
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
            cell.lblTitle.text = "Offering a Deal"
            cell.switchCtrl.isOn = false
            cell.delegate = self
            return cell
        case 1:
            if (indexPath.row == 0) {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "selectCell", for: indexPath) as! SelectCell
                cell.lblTitle.text = "Distance"
                cell.imgStatus.image = showAllDistances ? UIImage(named: "check") : UIImage(named: "arrow")
                cell.imgStatus.isHidden = false
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "selectCell", for: indexPath) as! SelectCell
                cell.lblTitle.text = "Distance" + String(describing: indexPath.row)
                cell.imgStatus.isHidden = true
                return cell
            }
        case 2:
            if (indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "selectCell", for: indexPath) as! SelectCell
                cell.lblTitle.text = "Sort By"
                cell.imgStatus.image = showAllSortConditions ? UIImage(named: "check") : UIImage(named: "arrow")
                cell.imgStatus.isHidden = false
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "selectCell", for: indexPath) as! SelectCell
                cell.lblTitle.text = "By" + String(describing: indexPath.row)
                cell.imgStatus.isHidden = true
                return cell
            }
        case 3:
            if (indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "seperatorCell", for: indexPath) as! SeperatorCell
                cell.lblTitle.text = "Category"
                return cell
            } else if (indexPath.row == 5) {
                if !showAllCategories {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "seperatorCell", for: indexPath) as! SeperatorCell
                    cell.lblTitle.text = "Select All"
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
                    cell.lblTitle.text = "Category" + String(describing: indexPath.row)
                    return cell
                }
            } else if (indexPath.row == 9) {
                if showAllCategories {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "seperatorCell", for: indexPath) as! SeperatorCell
                    cell.lblTitle.text = "Hide"
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
                    cell.lblTitle.text = "Category" + String(describing: indexPath.row)
                    return cell
                }
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
                cell.lblTitle.text = "Category" + String(describing: indexPath.row)
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath as NSIndexPath).section {
        case 1:
            if indexPath.row == 0 {
                showAllDistances = !showAllDistances
                tblSetting.reloadSections(IndexSet(integer: 1), with: .automatic)
                return
            }
        case 2:
            if indexPath.row == 0 {
                showAllSortConditions = !showAllSortConditions
                tblSetting.reloadSections(IndexSet(integer: 2), with: .automatic)
                return
            }
        case 3:
            if indexPath.row == 5 || indexPath.row == 9 {
                showAllCategories = !showAllCategories
                tblSetting.reloadSections(IndexSet(integer: 3), with: .automatic)
                return
            }
        default: return
        }
    }
}

extension FilterViewController: SwitchCellDelegate {
    func switchCellDidSwitchChanged(_ switchCell: SwitchCell) {
        tblSetting.reloadSections(IndexSet(integer: 1), with: .automatic)
    }
}
