//
//  GetSelectedCoffee.swift
//  Domain
//
//  Created by Przemysław Olszacki on 05/10/2021.
//

import Foundation
import Combine

public protocol GetSelectedCoffee {
    func get() -> AnyPublisher<Coffee?, Error>
}
