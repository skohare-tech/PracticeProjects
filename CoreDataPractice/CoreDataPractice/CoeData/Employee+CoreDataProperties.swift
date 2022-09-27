//
//  Employee+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by SachinK on 11/04/22.
//
//

import Foundation
import CoreData
extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var id: Int32
    @NSManaged public var address: String?
}

extension Employee : Identifiable {

}
