//
//  CoffeeListState.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 22/10/2021.
//

import Foundation

public struct CoffeeListState {
    public let coffees: [Coffee]
    public let selecetedCoffeeId: String?

    public init(coffees: [Coffee], selecetedCoffeeId: String?) {
        self.coffees = coffees
        self.selecetedCoffeeId = selecetedCoffeeId
    }
}

public enum CoffeeListAction {
    case selectCoffee(coffeeId: String?)
    case selectAddCoffee
    case selectBrewCoffee
    case deleteCoffee(coffeeId: String)

    case changeSelectedCoffeeId(coffeeId: String?)
}
