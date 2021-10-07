//
//  Coffee.swift
//  Domain
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import Foundation

public struct Coffee {
    public let id: String
    public let name: String
    public let roasteryName: String
    public let imagePath: String?
    public let brewings: [CoffeeBrewing]

    public init(
        id: String,
        name: String,
        roasteryName: String,
        imagePath: String?,
        brewings: [CoffeeBrewing]
    ) {
        self.id = id
        self.name = name
        self.roasteryName = roasteryName
        self.imagePath = imagePath
        self.brewings = brewings
    }
}
