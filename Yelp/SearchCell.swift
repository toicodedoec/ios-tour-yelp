//
//  SearchCell.swift
//  Yelp
//
//  Created by john on 2/25/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol SearchCellDelegate {
    @objc optional func searchCellDidTextChanged(_ searchCell: SearchCell, didChangeValue value: String)
}

class SearchCell: UITableViewCell, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    weak var delegate: SearchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        searchBar.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.endEditing(true)
        searchBar.resignFirstResponder()
        delegate?.searchCellDidTextChanged?(self, didChangeValue: searchBar.text!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        delegate?.searchCellDidTextChanged?(self, didChangeValue: "")
    }

}
