//
//  ViewsConstructor.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 18/10/2021.
//

import Foundation
import Domain
import Data

final class ViewsConstructor {

    static func coffeeListView(rootConnector: RootConnector) -> CoffeesList {
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
                                                    connector: rootConnector
                                                )
        )

        let activeCoffeeViewModel = ActiveCoffeeViewModel(getSelectedCoffee: coffeeUseCase)
        return CoffeesList(viewModel: viewModel, activeCoffeeViewModel: activeCoffeeViewModel)
    }

    static func addCoffeeView(rootConnector: RootConnector) -> AddCoffeeView {
        let coffeeRepository = CoreDataCoffeeRepository()
        let selectedCoffeeRepository = UserDefaultsSelectedCoffeeRepository()
        let coffeeUseCase = CoffeeUseCase(
            coffeeRepository: coffeeRepository,
            selectedCoffeeRepository: selectedCoffeeRepository
        )

        let viewModel = AddCoffeeViewModel(dependencies:
                                            .init(
                                                addCoffee: coffeeUseCase,
                                                connector: rootConnector
                                            )
        )
        return AddCoffeeView(viewModel: viewModel)
    }
}
