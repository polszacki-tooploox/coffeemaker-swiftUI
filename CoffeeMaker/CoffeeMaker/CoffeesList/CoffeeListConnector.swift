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

        let viewModel = CoffeesListViewModel(dependencies:
                                                .init(
                                                    getAllCofffees: coffeeUseCase,
                                                    deleteCoffee: coffeeUseCase,
                                                    connector: self
                                                )
        )
        return CoffeesList(viewModel: viewModel)
    }

    func addCoffeeView() -> AddCoffeeView {
        let repository = CoreDataCoffeeRepository()
        let coffeeUseCase = CoffeeUseCase(coffeeRepository: repository)

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
