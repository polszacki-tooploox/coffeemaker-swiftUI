//
//  CoffeeRepository.swift
//  Domain
//
//  Created by Przemysław Olszacki on 23/11/2020.
//

import Foundation
import Combine

public protocol CoffeeRepository {
    func getAllCoffees() -> AnyPublisher<[Coffee], Error>
    func addCoffee(coffee: Coffee) -> AnyPublisher<Never, Error>
    func deleteCoffee(coffee: Coffee) -> AnyPublisher<Never, Error>
}
