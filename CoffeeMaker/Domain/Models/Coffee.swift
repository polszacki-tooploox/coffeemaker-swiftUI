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
    public let color: ColorRGB
    public let imagePath: String?
    public let brewings: [CoffeeBrewing]

    public init(
        id: String,
        name: String,
        roasteryName: String,
        color: ColorRGB,
        imagePath: String?,
        brewings: [CoffeeBrewing]
    ) {
        self.id = id
        self.name = name
        self.roasteryName = roasteryName
        self.color = color
        self.imagePath = imagePath
        self.brewings = brewings
    }
}
