//
//  DataModel.swift
//  PageDesignPractice
//
//  Created by Admin on 31/01/22.
//

import Foundation

struct DataModel {
    
    var headerTitle: String?
    var subType: [String]?
    var isExpndable: Bool = false
    
    init(headerTitle: String, subType: [String], isExpndable: Bool )
    {
        self.headerTitle = headerTitle
        self.subType = subType
        self.isExpndable = isExpndable

    }
    
}
