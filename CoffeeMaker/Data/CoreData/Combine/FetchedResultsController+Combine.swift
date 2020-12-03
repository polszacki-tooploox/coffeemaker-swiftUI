//
//  FetchedResultsController+Combine.swift
//  Data
//
//  Created by Przemysław Olszacki on 27/11/2020.
//

import Foundation
import CoreData
import Combine

public final class CoreDataEntitiesPublisherProvider<Entity: NSManagedObject>: NSObject, NSFetchedResultsControllerDelegate {

    private let subject = CurrentValueSubject<[Entity], Error>([])
    private let fetchedResultsController: NSFetchedResultsController<Entity>

    public var publisher: AnyPublisher<[Entity], Error> {
        subject.eraseToAnyPublisher()
    }

    public init(fetchRequest: NSFetchRequest<Entity>, context: NSManagedObjectContext) {
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        super.init()
        fetchedResultsController.delegate = self
        fetchNewEntities()
    }

    private func fetchNewEntities() {
        fetchedResultsController.managedObjectContext.perform { [fetchedResultsController, subject] in
            try? fetchedResultsController.performFetch()
            let entities = fetchedResultsController.fetchedObjects ?? []
            subject.send(entities)
        }
    }

    // MARK: - NSFetchedResultsControllerDelegate

    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        fetchNewEntities()
    }
}
