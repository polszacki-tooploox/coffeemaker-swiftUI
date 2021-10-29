//
//  SelectCoffeeMiddleware.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 25/10/2021.
//

import Combine

public func changeSelectedCoffee(using selectedCoffeeRepository: SelectedCoffeeRepository) -> Middleware<AppState, AppAction> {
    { _, action in
        if case .coffeeListAction(let coffeeListAction) = action {
            if case .selectCoffee(coffeeId: let coffeeId) = coffeeListAction {
                selectedCoffeeRepository.selectCoffee(coffeeId: coffeeId)
            }
        }
        return Empty().eraseToAnyPublisher()
    }
}

public func listenToChangingSelectedCoffee(using selectedCoffeeRepository: SelectedCoffeeRepository) -> Middleware<AppState, AppAction> {
    { _, action in
        if case .coffeeListAction(let coffeeListAction) = action, case .initial = coffeeListAction {
            return selectedCoffeeRepository.getSelectedCoffeeId()
                .map {
                    AppAction.coffeeListAction(CoffeeListAction.changeSelectedCoffeeId(coffeeId: $0))
                }
                .print("[SELECTED]")
                .eraseToAnyPublisher()
        } else {
            return Empty().eraseToAnyPublisher()
        }
    }
}
