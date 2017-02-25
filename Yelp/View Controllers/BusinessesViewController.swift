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
    
    let refreshControl = UIRefreshControl()
    
    var businesses: [Business]!
    
    var isStartup: Bool = true;
    
    var prevFilter: Filter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblResult.dataSource = self
        tblResult.delegate = self
        
        isStartup = true;
        
        setupRefreshControl()
        
        loadData()
        
    }
    
    func loadData(){
        if(isStartup){
            // display loading indicator
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        Business.search(with: "Thai") { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                
                self.tblResult.reloadData()
                self.refreshControl.endRefreshing()
                
                MBProgressHUD.hide(for: self.view, animated: true)
                self.isStartup = false;
            }
        }
    }
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(loadData), for: UIControlEvents.valueChanged)
        tblResult.insertSubview(refreshControl, at: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navVC = segue.destination as! UINavigationController
        let filterVC = navVC.topViewController as! FilterViewController
        
        filterVC.criteria = prevFilter
        filterVC.delegate = self
    }
    
}

extension BusinessesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses == nil ? 0 : businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "businessCell", for: indexPath) as! BusinessViewCell
        
        cell.business = businesses[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension BusinessesViewController: FilterViewControllerDelegate {
    
    func filterViewControllerChangeValue(filterVC: FilterViewController, didUpdateFilter filter: Filter) {
        prevFilter = filter
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Business.search(with: "", sort: filter.sort.map { YelpSortMode(rawValue: $0) }!, categories: filter.categories, deals: filter.isDeal) { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                
                self.tblResult.reloadData()
                self.refreshControl.endRefreshing()
                
                MBProgressHUD.hide(for: self.view, animated: true)
                self.isStartup = false;
            }
        }
    }
}


