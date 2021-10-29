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

    static func coffeeListView(store: AppStore) -> CoffeesList {
        let activeCoffeeViewModel = ActiveCoffeeViewModel()
        let viewModel = CoffeesListViewModel(store: store)
        return CoffeesList(viewModel: viewModel, activeCoffeeViewModel: activeCoffeeViewModel)
    }

    static func addCoffeeView(store: AppStore) -> AddCoffeeView {
        let viewModel = AddCoffeeViewModel()
        return AddCoffeeView(viewModel: viewModel)
    }
}
