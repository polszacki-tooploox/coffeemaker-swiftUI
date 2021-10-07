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

    @Published var coffees: [Coffee] = []

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

    private func setupBinding() {
        // TODO: Handle error
        disposables.insert(dependencies.getAllCofffees.get().assertNoFailure().assign(to: \.coffees, on: self))
    }

    func deleteItems(indices: IndexSet) {
        indices.forEach {
            let coffee = coffees[$0]
            dependencies.deleteCoffee.delete(coffee: coffee)
        }
    }
}
