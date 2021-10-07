//
//  MockedModels.swift
//  Domain
//
//  Created by Przemysław Olszacki on 07/10/2021.
//

import Foundation
import Domain

extension Coffee {
    static var mocked: Coffee {
        Coffee(
            id: UUID().uuidString,
            name: "Brazil test coffee",
            roasteryName: "MOCK ROAST",
            imagePath: nil,
            brewings: [CoffeeBrewing.mocked]
        )
    }
}

extension CoffeeBrewing {
    static var mocked: CoffeeBrewing {
        CoffeeBrewing(
            id: UUID().uuidString,
            date: Date(),
            gramsIn: 16,
            gramsOut: 32,
            brewingTime: 30,
            temperature: 92
        )
    }
}
