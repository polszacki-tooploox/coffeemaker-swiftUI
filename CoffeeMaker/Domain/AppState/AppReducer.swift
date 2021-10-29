//
//  AppReducer.swift
//  Domain
//
//  Created by Przemysław Olszacki on 26/10/2021.
//

import Foundation

public let appReducer: Reducer<AppState, AppAction> = { state, action in

    var mutableState = state
    switch action {
    case .coffeeListAction(let coffeeListAction):
        mutableState.coffeeList = coffeeListReducer(state.coffeeList, coffeeListAction)
    case .addCoffeeAction(let addCoffeeAction):
        mutableState.addCoffee = addCoffeeReducer(state.addCoffee, addCoffeeAction)
    }
    mutableState = navigationReducer(mutableState, action)

    return mutableState
}
