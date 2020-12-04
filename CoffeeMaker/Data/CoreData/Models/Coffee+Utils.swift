//
//  Coffee+Domain.swift
//  Data
//
//  Created by Przemysław Olszacki on 04/12/2020.
//

import Foundation
import Domain
import CoreData

extension Coffee {
    var domainCoffee: Domain.Coffee { Domain.Coffee(name: name ?? "", imagePath: imageURL?.absoluteString) }
}

extension Domain.Coffee {

    func dataCoffee(context: NSManagedObjectContext) throws -> Coffee {
        let coffeeEntity = NSEntityDescription.entity(forEntityName: Coffee.entity().name!, in: context)!
        let coffee = NSManagedObject(entity: coffeeEntity, insertInto: context) as! Coffee
        coffee.name = name
        if let imagePath = imagePath {
            coffee.imageURL = URL(string: imagePath)
        }
        try context.save()
        return coffee
    }
}
