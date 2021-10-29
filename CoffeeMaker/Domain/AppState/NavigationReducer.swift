//
//  NavigationReducer.swift
//  Domain
//
//  Created by Przemysław Olszacki on 29/10/2021.
//

import Foundation

public let navigationReducer: Reducer<AppState, AppAction> = { state, action in

    var mutableState = state
    switch action {
    case .coffeeListAction(let coffeeListAction):
        if case .selectAddCoffee = coffeeListAction {
            mutableState.navigationState = .addCoffee
        }
    case .addCoffeeAction(let addCoffeeAction):
        if case .backAction = addCoffeeAction {
            mutableState.navigationState = .coffeeList
        }
    }

    return mutableState
}
