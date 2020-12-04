//
//  GetAllCoffees.swift
//  Domain
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import Foundation
import Combine

public protocol GetAllCoffees {
    func get() -> AnyPublisher<[Coffee], Error>
}
