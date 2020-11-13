//
//  RemoveCoffee.swift
//  Domain
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import Foundation
import Combine

public final class RemoveCoffee {

    public init() {}
    
    public func execute(coffee: Coffee) -> AnyPublisher<Never, Never> {
        // TODO
        return Empty<Never, Never>().eraseToAnyPublisher()
    }
}
