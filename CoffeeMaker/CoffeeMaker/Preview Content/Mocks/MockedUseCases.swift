//
//  MockedUseCases.swift
//  Domain
//
//  Created by Przemysław Olszacki on 07/10/2021.
//

import Foundation
import Combine
import Domain

final class MockedCoffeeUseCase: AddCoffee, DeleteCoffee, GetAllCoffees, GetSelectedCoffee, SetSelectedCoffee {

    private let mockSelectedCoffeeId: CurrentValueSubject<String?, Never>
    private let mockCoffees: CurrentValueSubject<[Coffee], Error>

    init(mockSelectedCoffeeId: String? = nil, mockCoffees: [Coffee]? = nil) {
        self.mockSelectedCoffeeId = CurrentValueSubject<String?, Never>(mockSelectedCoffeeId ?? Coffee.mocked.id)
        self.mockCoffees = CurrentValueSubject<[Coffee], Error>(mockCoffees ?? [Coffee.mocked])
    }

    func add(coffee: Coffee) -> AnyPublisher<Void, Error> {
        mockCoffees.send(mockCoffees.value + [coffee])
        return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func delete(coffee: Coffee) -> AnyPublisher<Void, Error> {
        var coffees = mockCoffees.value
        if let index = coffees.firstIndex(where: { $0.id == coffee.id }) {
            coffees.remove(at: index)
        }
        mockCoffees.send(coffees)
        return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func get() -> AnyPublisher<[Coffee], Error> {
        mockCoffees.eraseToAnyPublisher()
    }

    func get() -> AnyPublisher<Coffee?, Error> {
        mockCoffees.combineLatest(mockSelectedCoffeeId.setFailureType(to: Error.self))
            .map { allCoffees, selectedId in
                allCoffees.first(where: { $0.id == selectedId })
        }.eraseToAnyPublisher()
    }

    func select(coffeeId: String?) {
        mockSelectedCoffeeId.send(coffeeId)
    }
}
