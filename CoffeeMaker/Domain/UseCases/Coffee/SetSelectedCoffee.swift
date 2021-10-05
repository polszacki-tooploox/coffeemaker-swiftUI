//
//  SetSelectedCoffee.swift
//  Domain
//
//  Created by Przemysław Olszacki on 05/10/2021.
//

import Foundation
import Combine

public protocol SetSelectedCoffee {
    func select(coffee: Coffee?)
}
