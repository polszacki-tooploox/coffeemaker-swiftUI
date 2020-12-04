//
//  CoffeesListViewModel.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import Combine
import Domain

final class CoffeesListViewModel: ObservableObject, Identifiable {

    @Published var title: String = "Your coffees"
    @Published var dataSource: [Coffee] = []

    private let getAllCofffees: GetAllCoffees
    private let addCoffee: AddCoffee
    private let deleteCoffee: DeleteCoffee
    private var disposables = Set<AnyCancellable>()

    init(getAllCofffees: GetAllCoffees,
         addCoffee: AddCoffee,
         deleteCoffee: DeleteCoffee) {
        self.getAllCofffees = getAllCofffees
        self.addCoffee = addCoffee
        self.deleteCoffee = deleteCoffee

        setupBinding()
    }

    private func setupBinding() {
        // TODO: Handle error
        disposables.insert(getAllCofffees.get().assertNoFailure().assign(to: \.dataSource, on: self))
    }
}
