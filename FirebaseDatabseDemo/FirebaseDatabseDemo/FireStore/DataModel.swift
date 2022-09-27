//
//  DataModel.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 25/02/22.
//

import Foundation

struct UserModel {
    
    var name: String?
    var organization: String?
    
    init(name: String?, organization: String?) {
        self.name = name
        self.organization = organization
    }
    
}
