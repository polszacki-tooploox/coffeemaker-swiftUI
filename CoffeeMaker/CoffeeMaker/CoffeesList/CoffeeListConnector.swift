//
//  CoffeeListConnector.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 19/11/2020.
//

import Foundation
import SwiftUI
import Domain
import Data

final class CoffeeListConnector {

    func coffeeListView() -> CoffeesList {
        let repository = CoreDataCoffeeRepository()
        let coffeeUseCase = CoffeeUseCase(coffeeRepository: repository)

        let viewModel = CoffeesListViewModel(
            getAllCofffees: coffeeUseCase,
            addCoffee: coffeeUseCase,
            deleteCoffee: coffeeUseCase
        )
        return CoffeesList(viewModel: viewModel)
    }
}
