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
        let data = NSKeyedArchiver.archivedData(withRootObject: criteria)
        UserDefaults.standard.set(data, forKey: Const.Criteria_Key)
    }
    
    class func loadCriteria() -> Filter {
        if let _ = UserDefaults.standard.object(forKey: Const.Criteria_Key) {
            return UserDefaults.standard.object(forKey: Const.Criteria_Key) as! Filter;
        }
        return Filter(deals: false, radius: 0, sort: 0, category: [String]())
    }
    
    class func loadSearchValue() -> String {
        let lastActive = UserDefaults.standard.integer(forKey: Const.Last_Active_Key)
        let now = Date()
        
        if(Int(now.timeIntervalSince1970) - lastActive <= Const.Time_Out_Value) {
            return UserDefaults.standard.string(forKey: Const.Search_Value_Key)!
        }
        return ""
    }
    
    class func saveSearchValue(lastSearchValue: String) {
        let defaults = UserDefaults.standard
        defaults.set(lastSearchValue, forKey: Const.Search_Value_Key)
        
        let date = Date()
        let timeSecond = Int(date.timeIntervalSince1970)
        
        defaults.set(timeSecond, forKey: Const.Last_Active_Key)
        
        defaults.synchronize()
    }
}
