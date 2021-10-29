//
//  SelectCoffeeMiddleware.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 25/10/2021.
//

import Combine

public func listenToChangingSelectedCoffee(using selectedCoffeeRepository: SelectedCoffeeRepository) -> Middleware<AppState, AppAction> {
    { _, action in
        if case AppAction.coffeeListAction = action {
            return selectedCoffeeRepository.getSelectedCoffeeId()
                .map {
                    AppAction.coffeeListAction(CoffeeListAction.changeSelectedCoffeeId(coffeeId: $0))
                }
                .eraseToAnyPublisher()
        } else {
            return Empty().eraseToAnyPublisher()
        }
    }
}
