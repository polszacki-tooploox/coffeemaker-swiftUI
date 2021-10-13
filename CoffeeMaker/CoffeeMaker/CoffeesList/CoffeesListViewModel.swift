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

    private var selectedIndex: Int?

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

    func selectedCoffee(index: Int) {
        selectedIndex = index
        // TOOD: Use a use case to select
        for i in 0..<coffees.count {
            coffees[i].isSelected = i == selectedIndex
        }
    }

    private func setupBinding() {
        // TODO: Handle error
        // TODO: Add getting selected coffee use case
        disposables.insert(
            dependencies.getAllCofffees.get()
                .map { $0.map { CoffeeListItem(coffee: $0) }}
                .assertNoFailure()
                .assign(to: \.coffees, on: self)
        )
    }
}
