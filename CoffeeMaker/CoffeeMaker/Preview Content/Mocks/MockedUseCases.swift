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

    private var mockSelectedCoffee: Coffee?
    private var mockCoffees: [Coffee]

    init(mockSelectedCoffee: Coffee? = nil, mockCoffees: [Coffee]? = nil) {
        self.mockSelectedCoffee = mockSelectedCoffee ?? Coffee.mocked
        self.mockCoffees = mockCoffees ?? [Coffee.mocked]
    }

    func add(coffee: Coffee) -> AnyPublisher<Void, Error> {
        mockCoffees.append(coffee)
        return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func delete(coffee: Coffee) -> AnyPublisher<Void, Error> {
        if let index = mockCoffees.firstIndex(where: { $0.id == coffee.id }) {
            mockCoffees.remove(at: index)
        }
        return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func get() -> AnyPublisher<[Coffee], Error> {
        Just(mockCoffees).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func get() -> AnyPublisher<Coffee?, Error> {
        Just(mockSelectedCoffee).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func select(coffee: Coffee?) {
        mockSelectedCoffee = coffee
    }
}
