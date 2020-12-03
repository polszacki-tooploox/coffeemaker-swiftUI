//
//  TestCoreDataStack.swift
//  DataTests
//
//  Created by Przemysław Olszacki on 27/11/2020.
//

import CoreData
@testable import Data

final class TestCoreDataStack: CoreDataStack {

    override init() {
        super.init()

        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType

        let container = NSPersistentContainer(
          name: CoreDataStack.modelName,
          managedObjectModel: CoreDataStack.model)

        container.persistentStoreDescriptions = [persistentStoreDescription]

        container.loadPersistentStores { _, error in
          if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
          }
        }

        defaultContext = container.newBackgroundContext()
    }
}
