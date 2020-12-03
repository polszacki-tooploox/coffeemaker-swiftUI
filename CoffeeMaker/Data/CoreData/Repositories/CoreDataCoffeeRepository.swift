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

//public final class CoreDataCoffeeRepository: CoffeeRepository {
//
//    var context: NSManagedObjectContext = PersistenceController.shared.defaultContext
//
//    public  init() {}
//
//    public func getAllCoffees() -> AnyPublisher<Coffee, Error> {
//        let fetchAll = NSFetchRequest.init(entityName: Coffee.entity().name)
//        context
//    }
//
//    public func addCoffee(coffee: Coffee) -> AnyPublisher<Never, Error> {
//        <#code#>
//    }
//
//    public func deleteCoffee(coffee: Coffee) -> AnyPublisher<Never, Error> {
//        <#code#>
//    }
//}
