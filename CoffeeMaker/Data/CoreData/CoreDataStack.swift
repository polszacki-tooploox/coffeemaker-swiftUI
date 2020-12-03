//
//  Persistence.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()

    lazy var defaultContext: NSManagedObjectContext = {
        return container.newBackgroundContext()
    }()

    private let container: NSPersistentContainer

    static let modelName = "CoffeeMaker"
    static let model: NSManagedObjectModel = {
        let modelURL = Bundle(for: CoreDataStack.self).url(forResource: modelName, withExtension: "momd")!
      return NSManagedObjectModel(contentsOf: modelURL)!
    }()

    init() {
        container = NSPersistentContainer(name: CoreDataStack.modelName, managedObjectModel: CoreDataStack.model)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }

    func saveContext(context: NSManagedObjectContext) {
        context.perform {
          do {
            try context.save()
          } catch let error as NSError {
            assertionFailure("Unresolved error \(error), \(error.userInfo)")
          }
        }
    }
}
