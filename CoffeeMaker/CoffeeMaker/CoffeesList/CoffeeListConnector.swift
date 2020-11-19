//
//  CoffeeListConnector.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 19/11/2020.
//

import Foundation
import SwiftUI
import Domain

final class CoffeeListConnector {

    func coffeeListView() -> CoffeesList {
        let viewModel = CoffeesListViewModel(
            getAllCofffees: GetAllCoffees(),
            addCoffee: AddCoffee(),
            removeCoffee: RemoveCoffee()
        )
        return CoffeesList(viewModel: viewModel)
    }
}
