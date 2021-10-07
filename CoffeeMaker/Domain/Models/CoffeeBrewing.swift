//
//  CoffeeBrewing.swift
//  Domain
//
//  Created by Przemysław Olszacki on 07/10/2021.
//

import Foundation

public struct CoffeeBrewing {
    public let id: String
    public let date: Date
    public let gramsIn: Double
    public let gramsOut: Double
    public let brewingTime: TimeInterval
    public let temperature: Double

    public init(
        id: String,
        date: Date,
        gramsIn: Double,
        gramsOut: Double,
        brewingTime: TimeInterval,
        temperature: Double
    ) {
        self.id = id
        self.date = date
        self.gramsIn = gramsIn
        self.gramsOut = gramsOut
        self.brewingTime = brewingTime
        self.temperature = temperature
    }
}
