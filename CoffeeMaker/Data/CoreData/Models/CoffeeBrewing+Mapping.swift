//
//  CoffeeBrewing+Mapping.swift
//  Data
//
//  Created by Przemysław Olszacki on 07/10/2021.
//

import Foundation
import Domain
import CoreData

extension CoffeeBrewing {
    var domainCoffeeBrewing: Domain.CoffeeBrewing {
        Domain.CoffeeBrewing(
            id: id ?? UUID().uuidString,
            date: date ?? Date(),
            gramsIn: gramsIn,
            gramsOut: gramsOut,
            brewingTime: brewingTime,
            temperature: temperature
        )
    }
}

extension Domain.CoffeeBrewing {

    func dataCoffeeBrewing(context: NSManagedObjectContext) throws -> CoffeeBrewing {
        let coffeeBrewingEntity = NSEntityDescription.entity(forEntityName: CoffeeBrewing.entity().name!, in: context)!
        let coffeeBrewing = NSManagedObject(entity: coffeeBrewingEntity, insertInto: context) as! CoffeeBrewing
        coffeeBrewing.id = id
        coffeeBrewing.date = date
        coffeeBrewing.gramsIn = gramsIn
        coffeeBrewing.gramsOut = gramsOut
        coffeeBrewing.brewingTime = brewingTime
        coffeeBrewing.temperature = temperature
        try context.save()
        return coffeeBrewing
    }
}
