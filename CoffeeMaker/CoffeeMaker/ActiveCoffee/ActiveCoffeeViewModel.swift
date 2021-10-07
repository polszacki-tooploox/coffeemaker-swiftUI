//
//  ActiveCoffeeViewModel.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 05/10/2021.
//

import Combine
import Domain

final class ActiveCoffeeViewModel: ObservableObject, Identifiable {

    @Published private(set) var name: String = ""
    @Published private(set) var roasteryName: String = ""
    @Published private(set) var lastBrewText: String = ""

    private let getSelectedCoffee: GetSelectedCoffee
    private var cancellables = Set<AnyCancellable>()

    init(getSelectedCoffee: GetSelectedCoffee) {
        self.getSelectedCoffee = getSelectedCoffee

        setupBindings()
    }

    func onTapped() {

    }

    private func setupBindings() {
        getSelectedCoffee.get()
            .replaceError(with: nil)
            .compactMap { $0?.name }
            .assign(to: \.name, on: self)
            .store(in: &cancellables)

        getSelectedCoffee.get()
            .replaceError(with: nil)
            .compactMap { $0?.roasteryName }
            .assign(to: \.roasteryName, on: self)
            .store(in: &cancellables)

        getSelectedCoffee.get()
            .replaceError(with: nil)
            .compactMap {
                if let lastBrewing = $0?.brewings.first {
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
