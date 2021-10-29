//
//  CoffeeListReducer.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 22/10/2021.
//

import Foundation

public let coffeeListReducer: Reducer<CoffeeListState, CoffeeListAction> = { state, action in
    switch action {
    case .changeSelectedCoffeeId(coffeeId: let coffeeId):
        return CoffeeListState(coffees: state.coffees, selecetedCoffeeId: coffeeId)
    default:
        return state
    }
}
