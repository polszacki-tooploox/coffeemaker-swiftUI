//
//  CoffeeUseCase.swift
//  Domain
//
//  Created by Przemysław Olszacki on 04/12/2020.
//

import Foundation
import Combine


public final class CoffeeUseCase: AddCoffee, DeleteCoffee, GetAllCoffees, GetSelectedCoffee, SetSelectedCoffee {

    private let coffeeRepository: CoffeeRepository
    private let selectedCoffeeRepository: SelectedCoffeeRepository

    public init(coffeeRepository: CoffeeRepository, selectedCoffeeRepository: SelectedCoffeeRepository) {
        self.coffeeRepository = coffeeRepository
        self.selectedCoffeeRepository = selectedCoffeeRepository
    }

    public func add(coffee: Coffee) -> AnyPublisher<Never, Error> {
        coffeeRepository.addCoffee(coffee: coffee)
    }

    public func delete(coffee: Coffee) -> AnyPublisher<Never, Error> {
        coffeeRepository.deleteCoffee(coffee: coffee)
    }

    public func get() -> AnyPublisher<[Coffee], Error> {
        coffeeRepository.getAllCoffees()
    }

    public func get() -> AnyPublisher<Coffee?, Error> {
        coffeeRepository.getAllCoffees()
            .combineLatest(selectedCoffeeRepository.getSelectedCoffeeId().setFailureType(to: Error.self))
            .map { allCoffees, selectedCoffeeId in
                allCoffees.first(where: { $0.id == selectedCoffeeId })
            }
            .eraseToAnyPublisher()
    }

    public func select(coffee: Coffee?) {
        selectedCoffeeRepository.selectCoffee(coffeeId: coffee?.id)
    }
}
