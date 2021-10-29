//
//  ActiveCoffeeViewModel.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 05/10/2021.
//

import Combine
import Domain

final class ActiveCoffeeViewModel: ObservableObject, Identifiable {

    private let store: AppStore
    @Published private(set) var name: String = ""
    @Published private(set) var roasteryName: String = ""
    @Published private(set) var lastBrewText: String = ""

    private var cancellables = Set<AnyCancellable>()

    init(store: AppStore) {
        self.store = store
        setupBindings()
    }

    func onTapped() {
        // TODO
    }

    private func setupBindings() {
        let selectedCoffee = store.$state
            .compactMap { state in
                state.coffeeList.coffees.first(where: { $0.id == state.coffeeList.selecetedCoffeeId })
            }

        selectedCoffee
            .map(\.name)
            .assign(to: \.name, on: self)
            .store(in: &cancellables)

        selectedCoffee
            .map(\.roasteryName)
            .assign(to: \.roasteryName, on: self)
            .store(in: &cancellables)

        selectedCoffee
            .compactMap {
                if let lastBrewing = $0.brewings.first {
                    // TODO: Add date formatter and localize
                    return "Last shot \(lastBrewing.gramsIn)/\(lastBrewing.gramsOut) in \(lastBrewing.brewingTime)s"
                } else {
                    return ""
                }
            }
            .assign(to: \.lastBrewText, on: self)
            .store(in: &cancellables)
    }
}
