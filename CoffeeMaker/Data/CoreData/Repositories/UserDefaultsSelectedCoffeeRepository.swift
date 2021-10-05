//
//  UserDefaultsSelectedCoffeeRepository.swift
//  Data
//
//  Created by Przemysław Olszacki on 05/10/2021.
//

import Foundation
import Domain
import Combine

private extension UserDefaults {
    private static let selectedCoffeeKey = "Coffee_Selected"

    @objc var selectedCoffeeId: String? {
        get {
            return string(forKey: UserDefaults.selectedCoffeeKey)
        }
        set {
            set(newValue, forKey: UserDefaults.selectedCoffeeKey)
        }
    }
}

public final class UserDefaultsSelectedCoffeeRepository: SelectedCoffeeRepository {
    private let userDefaults: UserDefaults

    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    public func getSelectedCoffeeId() -> AnyPublisher<String?, Never> {
        userDefaults.publisher(for: \.selectedCoffeeId).eraseToAnyPublisher()
    }

    public func selectCoffee(coffeeId: String?) {
        userDefaults.selectedCoffeeId = coffeeId
    }
}
