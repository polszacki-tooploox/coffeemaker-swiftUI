//
//  SelectedCoffeeRepository.swift
//  Domain
//
//  Created by Przemysław Olszacki on 05/10/2021.
//

import Foundation
import Combine

public protocol SelectedCoffeeRepository {
    func getSelectedCoffeeId() -> AnyPublisher<String?, Never>
    func selectCoffee(coffeeId: String?)
}
