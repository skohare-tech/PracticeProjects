//
//  PersistatStorage.swift
//  CoreDataPractice
//
//  Created by SachinK on 11/04/22.
//

import Foundation
import CoreData

final class PersistantStorage {
    private init(){}
       
    static let shared = PersistantStorage()
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "DataFile")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
