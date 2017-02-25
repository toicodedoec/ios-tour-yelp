//
//  StorageUtils.swift
//  Flicks
//
//  Created by john on 2/19/17.
//  Copyright © 2017 doannx. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    class func saveCriteria(criteria: Filter) {
        UserDefaults.standard.set(criteria, forKey: Const.Criteria_Key)
    }
    
    class func loadCriteria() -> Filter {
        if let _ = UserDefaults.standard.object(forKey: Const.Criteria_Key) {
            return UserDefaults.standard.object(forKey: Const.Criteria_Key) as! Filter;
        }
        return Filter(deals: false, radius: 0, sort: 0, category: [String]())
    }
}
