//
//  Coffee+Mapping.swift
//  Data
//
//  Created by Przemysław Olszacki on 04/12/2020.
//

import Foundation
import Domain
import CoreData

extension Coffee {
    var domainCoffee: Domain.Coffee {
        Domain.Coffee(
            id: id!,
            name: name!,
            roasteryName: roasteryName!,
            color: try! JSONDecoder().decode(ColorRGB.self, from: color!),
            imagePath: imageURL?.absoluteString,
            brewings: brewings!.allObjects.map { ($0 as! CoffeeBrewing).domainCoffeeBrewing }
        )
    }
}

extension Domain.Coffee {

    func dataCoffee(context: NSManagedObjectContext) throws -> Coffee {
        let coffeeEntity = NSEntityDescription.entity(forEntityName: Coffee.entity().name!, in: context)!
        let coffee = NSManagedObject(entity: coffeeEntity, insertInto: context) as! Coffee
        coffee.name = name
        coffee.roasteryName = roasteryName
        coffee.color = try JSONEncoder().encode(color)
        if let imagePath = imagePath {
            coffee.imageURL = URL(string: imagePath)
        }
        coffee.brewings = NSSet(array: try brewings.map{ try $0.dataCoffeeBrewing(context: context) })
        try context.save()
        return coffee
    }
}
