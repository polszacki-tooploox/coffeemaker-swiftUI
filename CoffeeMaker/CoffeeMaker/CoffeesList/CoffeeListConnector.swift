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
        let coffeeRepository = CoreDataCoffeeRepository()
        let selectedCoffeeRepository = UserDefaultsSelectedCoffeeRepository()
        let coffeeUseCase = CoffeeUseCase(
            coffeeRepository: coffeeRepository,
            selectedCoffeeRepository: selectedCoffeeRepository
        )

        let viewModel = CoffeesListViewModel(dependencies:
                                                .init(
                                                    getAllCofffees: coffeeUseCase,
                                                    getSelectedCoffee: coffeeUseCase,
                                                    setSelectedCoffee: coffeeUseCase,
                                                    deleteCoffee: coffeeUseCase,
                                                    connector: self
                                                )
        )

        let activeCoffeeViewModel = ActiveCoffeeViewModel(getSelectedCoffee: coffeeUseCase)
        return CoffeesList(viewModel: viewModel, activeCoffeeViewModel: activeCoffeeViewModel)
    }

    func addCoffeeView() -> AddCoffeeView {
        let coffeeRepository = CoreDataCoffeeRepository()
        let selectedCoffeeRepository = UserDefaultsSelectedCoffeeRepository()
        let coffeeUseCase = CoffeeUseCase(
            coffeeRepository: coffeeRepository,
            selectedCoffeeRepository: selectedCoffeeRepository
        )

        let viewModel = AddCoffeeViewModel(dependencies:
                                            .init(
                                                addCoffee: coffeeUseCase
                                            )
        )
        return AddCoffeeView(viewModel: viewModel)
    }

    func dismiss() {
        
    }
}
