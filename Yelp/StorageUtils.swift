//
//  StorageUtils.swift
//  Yelp
//
//  Created by john on 2/25/17.
//  Copyright © 2017 doannx. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    class func saveCriteria(criteria: Filter) {
        let data = NSKeyedArchiver.archivedData(withRootObject: criteria)
        UserDefaults.standard.set(data, forKey: Const.Criteria_Key)
    }
    
    class func loadCriteria() -> Filter {
        return (UserDefaults.standard.object(forKey: Const.Criteria_Key) != nil) ? UserDefaults.standard.object(forKey: Const.Criteria_Key) as! Filter : Filter(deals: false, radius: 0, sort: 0, category: [String]())
    }
    
    class func loadSearchValue() -> String {
        return Int(Date().timeIntervalSince1970) - UserDefaults.standard.integer(forKey: Const.Last_Active_Key) <= Const.Time_Out_Value ? UserDefaults.standard.string(forKey: Const.Search_Value_Key)! : Const.Empty_String
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
