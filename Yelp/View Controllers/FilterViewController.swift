//
//  FilterViewController.swift
//  Yelp
//
//  Created by john on 2/24/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate  {
    func filterViewControllerChangeValue(filterVC: FilterViewController, didUpdateFilter filter: [String])
}

class FilterViewController: UIViewController {
    
    let categories: [Dictionary<String, String>] = [["name" : "Afghan", "code": "afghani"],
                                                    ["name" : "African", "code": "african"],
                                                    ["name" : "American, New", "code": "newamerican"],
                                                    ["name" : "American, Traditional", "code": "tradamerican"],
                                                    ["name" : "Arabian", "code": "arabian"],
                                                    ["name" : "Argentine", "code": "argentine"],
                                                    ["name" : "Armenian", "code": "armenian"],
                                                    ["name" : "Asian Fusion", "code": "asianfusion"],
                                                    ["name" : "Asturian", "code": "asturian"],
                                                    ["name" : "Australian", "code": "australian"],
                                                    ["name" : "Austrian", "code": "austrian"],
                                                    ["name" : "Baguettes", "code": "baguettes"],
                                                    ["name" : "Bangladeshi", "code": "bangladeshi"],
                                                    ["name" : "Barbeque", "code": "bbq"],
                                                    ["name" : "Basque", "code": "basque"],
                                                    ["name" : "Bavarian", "code": "bavarian"],
                                                    ["name" : "Beer Garden", "code": "beergarden"],
                                                    ["name" : "Beer Hall", "code": "beerhall"],
                                                    ["name" : "Beisl", "code": "beisl"],
                                                    ["name" : "Belgian", "code": "belgian"],
                                                    ["name" : "Bistros", "code": "bistros"],
                                                    ["name" : "Black Sea", "code": "blacksea"],
                                                    ["name" : "Brasseries", "code": "brasseries"],
                                                    ["name" : "Brazilian", "code": "brazilian"],
                                                    ["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],
                                                    ["name" : "British", "code": "british"],
                                                    ["name" : "Buffets", "code": "buffets"],
                                                    ["name" : "Bulgarian", "code": "bulgarian"],
                                                    ["name" : "Burgers", "code": "burgers"],
                                                    ["name" : "Burmese", "code": "burmese"],
                                                    ["name" : "Cafes", "code": "cafes"],
                                                    ["name" : "Cafeteria", "code": "cafeteria"],
                                                    ["name" : "Cajun/Creole", "code": "cajun"],
                                                    ["name" : "Cambodian", "code": "cambodian"],
                                                    ["name" : "Canadian", "code": "New)"],
                                                    ["name" : "Canteen", "code": "canteen"],
                                                    ["name" : "Caribbean", "code": "caribbean"],
                                                    ["name" : "Catalan", "code": "catalan"],
                                                    ["name" : "Chech", "code": "chech"],
                                                    ["name" : "Cheesesteaks", "code": "cheesesteaks"],
                                                    ["name" : "Chicken Shop", "code": "chickenshop"],
                                                    ["name" : "Chicken Wings", "code": "chicken_wings"],
                                                    ["name" : "Chilean", "code": "chilean"],
                                                    ["name" : "Chinese", "code": "chinese"],
                                                    ["name" : "Comfort Food", "code": "comfortfood"],
                                                    ["name" : "Corsican", "code": "corsican"],
                                                    ["name" : "Creperies", "code": "creperies"],
                                                    ["name" : "Cuban", "code": "cuban"],
                                                    ["name" : "Curry Sausage", "code": "currysausage"],
                                                    ["name" : "Cypriot", "code": "cypriot"],
                                                    ["name" : "Czech", "code": "czech"],
                                                    ["name" : "Czech/Slovakian", "code": "czechslovakian"],
                                                    ["name" : "Danish", "code": "danish"],
                                                    ["name" : "Delis", "code": "delis"],
                                                    ["name" : "Diners", "code": "diners"],
                                                    ["name" : "Dumplings", "code": "dumplings"],
                                                    ["name" : "Eastern European", "code": "eastern_european"],
                                                    ["name" : "Ethiopian", "code": "ethiopian"],
                                                    ["name" : "Fast Food", "code": "hotdogs"],
                                                    ["name" : "Filipino", "code": "filipino"],
                                                    ["name" : "Fish & Chips", "code": "fishnchips"],
                                                    ["name" : "Fondue", "code": "fondue"],
                                                    ["name" : "Food Court", "code": "food_court"],
                                                    ["name" : "Food Stands", "code": "foodstands"],
                                                    ["name" : "French", "code": "french"],
                                                    ["name" : "French Southwest", "code": "sud_ouest"],
                                                    ["name" : "Galician", "code": "galician"],
                                                    ["name" : "Gastropubs", "code": "gastropubs"],
                                                    ["name" : "Georgian", "code": "georgian"],
                                                    ["name" : "German", "code": "german"],
                                                    ["name" : "Giblets", "code": "giblets"],
                                                    ["name" : "Gluten-Free", "code": "gluten_free"],
                                                    ["name" : "Greek", "code": "greek"],
                                                    ["name" : "Halal", "code": "halal"],
                                                    ["name" : "Hawaiian", "code": "hawaiian"],
                                                    ["name" : "Heuriger", "code": "heuriger"],
                                                    ["name" : "Himalayan/Nepalese", "code": "himalayan"],
                                                    ["name" : "Hong Kong Style Cafe", "code": "hkcafe"],
                                                    ["name" : "Hot Dogs", "code": "hotdog"],
                                                    ["name" : "Hot Pot", "code": "hotpot"],
                                                    ["name" : "Hungarian", "code": "hungarian"],
                                                    ["name" : "Iberian", "code": "iberian"],
                                                    ["name" : "Indian", "code": "indpak"],
                                                    ["name" : "Indonesian", "code": "indonesian"],
                                                    ["name" : "International", "code": "international"],
                                                    ["name" : "Irish", "code": "irish"],
                                                    ["name" : "Island Pub", "code": "island_pub"],
                                                    ["name" : "Israeli", "code": "israeli"],
                                                    ["name" : "Italian", "code": "italian"],
                                                    ["name" : "Japanese", "code": "japanese"],
                                                    ["name" : "Jewish", "code": "jewish"],
                                                    ["name" : "Kebab", "code": "kebab"],
                                                    ["name" : "Korean", "code": "korean"],
                                                    ["name" : "Kosher", "code": "kosher"],
                                                    ["name" : "Kurdish", "code": "kurdish"],
                                                    ["name" : "Laos", "code": "laos"],
                                                    ["name" : "Laotian", "code": "laotian"],
                                                    ["name" : "Latin American", "code": "latin"],
                                                    ["name" : "Live/Raw Food", "code": "raw_food"],
                                                    ["name" : "Lyonnais", "code": "lyonnais"],
                                                    ["name" : "Malaysian", "code": "malaysian"],
                                                    ["name" : "Meatballs", "code": "meatballs"],
                                                    ["name" : "Mediterranean", "code": "mediterranean"],
                                                    ["name" : "Mexican", "code": "mexican"],
                                                    ["name" : "Middle Eastern", "code": "mideastern"],
                                                    ["name" : "Milk Bars", "code": "milkbars"],
                                                    ["name" : "Modern Australian", "code": "modern_australian"],
                                                    ["name" : "Modern European", "code": "modern_european"],
                                                    ["name" : "Mongolian", "code": "mongolian"],
                                                    ["name" : "Moroccan", "code": "moroccan"],
                                                    ["name" : "New Zealand", "code": "newzealand"],
                                                    ["name" : "Night Food", "code": "nightfood"],
                                                    ["name" : "Norcinerie", "code": "norcinerie"],
                                                    ["name" : "Open Sandwiches", "code": "opensandwiches"],
                                                    ["name" : "Oriental", "code": "oriental"],
                                                    ["name" : "Pakistani", "code": "pakistani"],
                                                    ["name" : "Parent Cafes", "code": "eltern_cafes"],
                                                    ["name" : "Parma", "code": "parma"],
                                                    ["name" : "Persian/Iranian", "code": "persian"],
                                                    ["name" : "Peruvian", "code": "peruvian"],
                                                    ["name" : "Pita", "code": "pita"],
                                                    ["name" : "Pizza", "code": "pizza"],
                                                    ["name" : "Polish", "code": "polish"],
                                                    ["name" : "Portuguese", "code": "portuguese"],
                                                    ["name" : "Potatoes", "code": "potatoes"],
                                                    ["name" : "Poutineries", "code": "poutineries"],
                                                    ["name" : "Pub Food", "code": "pubfood"],
                                                    ["name" : "Rice", "code": "riceshop"],
                                                    ["name" : "Romanian", "code": "romanian"],
                                                    ["name" : "Rotisserie Chicken", "code": "rotisserie_chicken"],
                                                    ["name" : "Rumanian", "code": "rumanian"],
                                                    ["name" : "Russian", "code": "russian"],
                                                    ["name" : "Salad", "code": "salad"],
                                                    ["name" : "Sandwiches", "code": "sandwiches"],
                                                    ["name" : "Scandinavian", "code": "scandinavian"],
                                                    ["name" : "Scottish", "code": "scottish"],
                                                    ["name" : "Seafood", "code": "seafood"],
                                                    ["name" : "Serbo Croatian", "code": "serbocroatian"],
                                                    ["name" : "Signature Cuisine", "code": "signature_cuisine"],
                                                    ["name" : "Singaporean", "code": "singaporean"],
                                                    ["name" : "Slovakian", "code": "slovakian"],
                                                    ["name" : "Soul Food", "code": "soulfood"],
                                                    ["name" : "Soup", "code": "soup"],
                                                    ["name" : "Southern", "code": "southern"],
                                                    ["name" : "Spanish", "code": "spanish"],
                                                    ["name" : "Steakhouses", "code": "steak"],
                                                    ["name" : "Sushi Bars", "code": "sushi"],
                                                    ["name" : "Swabian", "code": "swabian"],
                                                    ["name" : "Swedish", "code": "swedish"],
                                                    ["name" : "Swiss Food", "code": "swissfood"],
                                                    ["name" : "Tabernas", "code": "tabernas"],
                                                    ["name" : "Taiwanese", "code": "taiwanese"],
                                                    ["name" : "Tapas Bars", "code": "tapas"],
                                                    ["name" : "Tapas/Small Plates", "code": "tapasmallplates"],
                                                    ["name" : "Tex-Mex", "code": "tex-mex"],
                                                    ["name" : "Thai", "code": "thai"],
                                                    ["name" : "Traditional Norwegian", "code": "norwegian"],
                                                    ["name" : "Traditional Swedish", "code": "traditional_swedish"],
                                                    ["name" : "Trattorie", "code": "trattorie"],
                                                    ["name" : "Turkish", "code": "turkish"],
                                                    ["name" : "Ukrainian", "code": "ukrainian"],
                                                    ["name" : "Uzbek", "code": "uzbek"],
                                                    ["name" : "Vegan", "code": "vegan"],
                                                    ["name" : "Vegetarian", "code": "vegetarian"],
                                                    ["name" : "Venison", "code": "venison"],
                                                    ["name" : "Vietnamese", "code": "vietnamese"],
                                                    ["name" : "Wok", "code": "wok"],
                                                    ["name" : "Wraps", "code": "wraps"],
                                                    ["name" : "Yugoslav", "code": "yugoslav"]]
    
    var switchStates = [Int: Bool]()
    
    var delegate: FilterViewControllerDelegate!
    
    @IBOutlet weak var tblSetting: UITableView!
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        var filters = [String]()
        for (row, isSelected) in switchStates {
            if isSelected {
                filters.append(categories[row]["code"]!)
            }
        }
        print(filters)
        if(!filters.isEmpty){
            delegate.filterViewControllerChangeValue(filterVC: self, didUpdateFilter: filters)
        }
        
        dismiss(animated: true, completion: nil)
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
        case 1: return indexPath.row > 1 ? (!showAllDistances ? 0 : 40) : 40
        case 2: return indexPath.row > 1 ? (!showAllSortConditions ? 0 : 40) : 40
        case 3: return indexPath.row > 7 ? (!showAllCategories ? 0 : 40) : 40
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
        case 3: return categories.count + 3
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
            if(indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "seperatorCell", for: indexPath) as! SeperatorCell
                cell.lblTitle.text = "Distance"
                return cell
            } else if (indexPath.row == 1) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "selectCell", for: indexPath) as! SelectCell
                cell.lblTitle.text = "Previous Value"
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
            if(indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "seperatorCell", for: indexPath) as! SeperatorCell
                cell.lblTitle.text = "Sort By"
                return cell
            } else if (indexPath.row == 1) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "selectCell", for: indexPath) as! SelectCell
                cell.lblTitle.text = "Previous Value"
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
            } else if (indexPath.row == 1) {
                return tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchCell
            } else if (indexPath.row == 7) {
                if !showAllCategories {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "seperatorCell", for: indexPath) as! SeperatorCell
                    cell.lblTitle.text = "Select All"
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
                    cell.lblTitle.text = categories[indexPath.row - 2]["name"]
                    cell.switchCtrl.isOn = switchStates[indexPath.row - 2] ?? false
                    cell.delegate = self
                    return cell
                }
            } else if (indexPath.row == categories.count + 2) {
                if showAllCategories {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "seperatorCell", for: indexPath) as! SeperatorCell
                    cell.lblTitle.text = "Hide"
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
                    cell.lblTitle.text = categories[indexPath.row - 3]["name"]
                    cell.switchCtrl.isOn = switchStates[indexPath.row - 3] ?? false
                    cell.delegate = self
                    return cell
                }
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
                cell.lblTitle.text = categories[indexPath.row - 2]["name"]
                cell.switchCtrl.isOn = switchStates[indexPath.row - 2] ?? false
                cell.delegate = self
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath as NSIndexPath).section {
        case 1:
            if indexPath.row == 1 {
                showAllDistances = !showAllDistances
                tblSetting.reloadSections(IndexSet(integer: 1), with: .automatic)
                return
            }
        case 2:
            if indexPath.row == 1 {
                showAllSortConditions = !showAllSortConditions
                tblSetting.reloadSections(IndexSet(integer: 2), with: .automatic)
                return
            }
        case 3:
            if indexPath.row == 7 || indexPath.row == categories.count + 2 {
                showAllCategories = !showAllCategories
                tblSetting.reloadSections(IndexSet(integer: 3), with: .automatic)
                return
            }
        default: return
        }
    }
}

extension FilterViewController: SwitchCellDelegate {
    func switchCellDidSwitchChanged(_ switchCell: SwitchCell, didChangeValue value: Bool) {
        let ip = tblSetting.indexPath(for: switchCell)
        switchStates[(ip?.row)!] = value
    }
}
