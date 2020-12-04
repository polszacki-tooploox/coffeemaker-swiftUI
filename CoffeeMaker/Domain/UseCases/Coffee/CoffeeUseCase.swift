//
//  CoffeeUseCase.swift
//  Domain
//
//  Created by Przemysław Olszacki on 04/12/2020.
//

import Foundation
import Combine


public final class CoffeeUseCase: AddCoffee, DeleteCoffee, GetAllCoffees {

    private let coffeeRepository: CoffeeRepository

    public init(coffeeRepository: CoffeeRepository) {
        self.coffeeRepository = coffeeRepository
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
}
