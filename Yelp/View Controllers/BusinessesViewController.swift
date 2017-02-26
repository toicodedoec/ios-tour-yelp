//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Chau Vo on 10/17/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit
import MBProgressHUD

class BusinessesViewController: UIViewController {
    
    @IBOutlet weak var tblResult: UITableView!
    @IBOutlet weak var searchBarCtrl: UISearchBar!
    let refreshControl = UIRefreshControl()
    
    var businesses: [Business]!
    var filteredBusinesses: [Business]!
    var selectedBusiness: Business?
    
    var isStartup: Bool = true;
    
    var prevFilter: Filter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblResult.dataSource = self
        tblResult.delegate = self
        
        searchBarCtrl.delegate = self
        self.navigationItem.titleView = searchBarCtrl
        
        setupRefreshControl()
        
        loadData()
    }
    
    func loadData(){
        if isStartup {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        Business.search(with: Const.Empty_String) { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                
                let lastSearchValue = UserDefaults.loadSearchValue()
                
                self.filteredBusinesses = lastSearchValue.isEmpty ? self.businesses : self.businesses.filter { (item: Business) -> Bool in
                    return (item.name?.contains(lastSearchValue))!
                }
                
                self.searchBarCtrl.text = lastSearchValue
                
                self.tblResult.reloadData()
                
                self.refreshControl.endRefreshing()
                
                if self.isStartup {
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.isStartup = false;
                }
            }
        }
    }
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(loadData), for: UIControlEvents.valueChanged)
        tblResult.insertSubview(refreshControl, at: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFilter" {
            let navVC = segue.destination as! UINavigationController
            let filterVC = navVC.topViewController as! FilterViewController
            
            filterVC.criteria = prevFilter
            filterVC.delegate = self
        } else if segue.identifier == "showDetails" {
            let nextVC = segue.destination as! BusinessDetailViewController
            nextVC.businessDetail = selectedBusiness
        }
    }
}

extension BusinessesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBusinesses == nil ? 0 : filteredBusinesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "businessCell", for: indexPath) as! BusinessViewCell
        
        cell.business = filteredBusinesses[indexPath.row]
        
        // update cell selection style
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red:0.96, green:0.97, blue:0.70, alpha:1.0)
        backgroundView.layer.borderWidth = 1
        backgroundView.layer.borderColor = UIColor.gray.cgColor
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBusiness = filteredBusinesses[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: self)
    }
}

extension BusinessesViewController: FilterViewControllerDelegate {
    func filterViewControllerChangeValue(filterVC: FilterViewController, didUpdateFilter filter: Filter) {
        prevFilter = filter
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Business.search(with: Const.Empty_String, sort: filter.sort.map { YelpSortMode(rawValue: $0) }!, categories: filter.categories, deals: filter.isDeal) { (businesses: [Business]?, error: Error?) in
            
            if let businesses = businesses {
                self.businesses = businesses
                
                let lastSearchValue = UserDefaults.loadSearchValue()
                
                self.filteredBusinesses = lastSearchValue.isEmpty ? self.businesses : self.businesses.filter { (item: Business) -> Bool in
                    return (item.name?.contains(lastSearchValue))!
                }
                
                self.searchBarCtrl.text = lastSearchValue
                
                self.tblResult.reloadData()
                
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }
}

extension BusinessesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredBusinesses = searchText.isEmpty ? businesses : businesses.filter { (item: Business) -> Bool in
            return (item.name?.contains(searchText))!
        }
        
        UserDefaults.saveSearchValue(lastSearchValue: searchText)
        
        tblResult.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBarCtrl.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        searchBarCtrl.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBarCtrl.showsCancelButton = false
        searchBarCtrl.text = Const.Empty_String
        searchBarCtrl.resignFirstResponder()
        
        filteredBusinesses = businesses
        
        UserDefaults.saveSearchValue(lastSearchValue: Const.Empty_String)
        
        tblResult.reloadData()
    }
}



