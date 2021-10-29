//
//  CoffeesListViewModel.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import Domain
import SwiftUI

final class CoffeesListViewModel: ObservableObject, Identifiable {

    private let store: AppStore

    @Published var coffees = [CoffeeListItem]()

    init(store: AppStore) {
        self.store = store
        setupBindings()
    }
    
    private func setupBindings() {
        coffees = store.state.coffeeList.coffees
            .map {
                CoffeeListItem(coffee: $0, isSelected: $0.id == store.state.coffeeList.selecetedCoffeeId)
            }
    }

    func selectedCoffee(coffee: CoffeeListItem) {
        store.dispatch(.coffeeListAction(.selectCoffee(coffeeId: coffee.id)))
    }

    func addCoffeeSelected() {
        store.dispatch(.coffeeListAction(.selectAddCoffee))
    }
}
