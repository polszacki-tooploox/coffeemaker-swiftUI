//
//  CoffeeListItem.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 13/10/2021.
//

import Foundation
import Domain
import SwiftUI

struct CoffeeListItem: Identifiable {

    let id: String
    let mainText: String
    let detailText: String
    let color: Color
    var isSelected: Bool

    init(coffee: Coffee) {
        id = coffee.id
        mainText = coffee.name
        detailText = coffee.roasteryName
        color = coffee.color.toColor()
        isSelected = false
    }
}
