//
//  AppState.swift
//  Domain
//
//  Created by Przemysław Olszacki on 25/10/2021.
//

import Foundation

public struct AppState {
    public var coffeeList: CoffeeListState
    public var addCoffee: AddCoffeeState
    public var navigationState: NavigationState

    public init(
        coffeeList: CoffeeListState,
        addCoffee: AddCoffeeState,
        navigationState: NavigationState
    ) {
        self.coffeeList = coffeeList
        self.addCoffee = addCoffee
        self.navigationState = navigationState
    }
}

public enum AppAction {
    case coffeeListAction(CoffeeListAction)
    case addCoffeeAction(AddCoffeeAction)
}
