//
//  CoreDataCoffeeRepository.swift
//  Data
//
//  Created by Przemysław Olszacki on 23/11/2020.
//

import Foundation
import Domain
import Combine
import CoreData

public final class CoreDataCoffeeRepository: CoffeeRepository {

    private let context: NSManagedObjectContext
    private let coffeeEntitiesPublisher: CoreDataEntitiesPublisherProvider<Coffee>

    public init() {
        self.context = CoreDataStack.shared.defaultContext

        let request: NSFetchRequest<Coffee> = Coffee.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Coffee.name, ascending: true)]

        self.coffeeEntitiesPublisher = CoreDataEntitiesPublisherProvider(
            fetchRequest: request,
            context: CoreDataStack.shared.defaultContext
        )
    }

    init(context: NSManagedObjectContext, coffeeEntitiesPublisher: CoreDataEntitiesPublisherProvider<Coffee>) {
        self.context = context
        self.coffeeEntitiesPublisher = coffeeEntitiesPublisher
    }

    public func getAllCoffees() -> AnyPublisher<[Domain.Coffee], Error> {
        return coffeeEntitiesPublisher.publisher.map { items in
            items.map(\.domainCoffee)
        }.eraseToAnyPublisher()
    }

    public func addCoffee(coffee: Domain.Coffee) -> AnyPublisher<Never, Error> {
        do {
            _ = try coffee.dataCoffee(context: context)
            return Empty().eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }

    public func deleteCoffee(coffee: Domain.Coffee) -> AnyPublisher<Never, Error> {
        do {
            _ = try coffee.dataCoffee(context: context)
            return Empty().eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
