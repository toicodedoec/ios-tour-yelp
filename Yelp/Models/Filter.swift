//
//  Filter.swift
//  Yelp
//
//  Created by john on 2/25/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import Foundation

class Filter : NSObject {
    let isDeal: Bool?
    let distance: Int?
    let sort: Int?
    let categories: [String]?
    
    init(deals dealFilter: Bool, radius distanceFilter: Int, sort sortFilter: Int, category catetogriesFilter: [String]) {
        isDeal = dealFilter
        distance = distanceFilter
        sort = sortFilter
        categories = catetogriesFilter
    }
}
