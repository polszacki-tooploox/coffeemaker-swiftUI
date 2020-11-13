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
    private let removeCoffee: RemoveCoffee
    private var disposables = Set<AnyCancellable>()

    init(getAllCofffees: GetAllCoffees,
         addCoffee: AddCoffee,
         removeCoffee: RemoveCoffee) {
        self.getAllCofffees = getAllCofffees
        self.addCoffee = addCoffee
        self.removeCoffee = removeCoffee

        setupBinding()
    }

    private func setupBinding() {
        disposables.insert(getAllCofffees.execute().assign(to: \.dataSource, on: self))
    }
}
