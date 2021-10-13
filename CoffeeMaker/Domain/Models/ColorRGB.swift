//
//  ColorRGB.swift
//  Domain
//
//  Created by Przemysław Olszacki on 13/10/2021.
//

import Foundation

public struct ColorRGB: Codable {
    public let red: Int
    public let green: Int
    public let blue: Int
    public let alpha: Int

    public init(red: Int, green: Int, blue: Int, alpha: Int = 255) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}
