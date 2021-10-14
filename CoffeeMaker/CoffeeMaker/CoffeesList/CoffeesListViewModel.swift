//
//  CoffeesListViewModel.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import Combine
import Domain
import UIKit

final class CoffeesListViewModel: ObservableObject, Identifiable {

    @Published var coffees: [CoffeeListItem] = []

    var addCoffeeView: AddCoffeeView {
        return dependencies.connector.addCoffeeView()
    }

    struct Dependencies {
        let getAllCofffees: GetAllCoffees
        let getSelectedCoffee: GetSelectedCoffee
        let setSelectedCoffee: SetSelectedCoffee
        let deleteCoffee: DeleteCoffee
        let connector: CoffeeListConnector
    }

    private var disposables = Set<AnyCancellable>()
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        setupBinding()
    }

    func selectedCoffee(coffee: CoffeeListItem) {
        dependencies.setSelectedCoffee.select(coffeeId: coffee.id)
    }

    private func setupBinding() {
        // TODO: Handle error
        disposables.insert(
            dependencies.getAllCofffees.get()
                .combineLatest(dependencies.getSelectedCoffee.get())
                .map { (allCoffees, selectedCoffee) in
                    allCoffees.map {
                        CoffeeListItem(coffee: $0, isSelected: selectedCoffee == $0)
                    }
                }
                .assertNoFailure()
                .assign(to: \.coffees, on: self)
        )
    }
}
