//
//  AddCoffee.swift
//  Domain
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import Foundation
import Combine

public protocol AddCoffee {
    func add(coffee: Coffee) -> AnyPublisher<Void, Error>
}
