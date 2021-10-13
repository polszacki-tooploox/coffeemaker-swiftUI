//
//  Color+CoffeeMaker.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 05/10/2021.
//

import SwiftUI

extension Color {

    init(r: Int, g: Int, b: Int, a: Int = 255) {
        self.init(.sRGB, red: Double(r)/255.0, green: Double(g)/255.0, blue: Double(b)/255.0, opacity: Double(a)/255.0)
    }

    static var lightAccent: Color {
        return Color(r: 24, g: 120, b: 120)
    }

    static var darkAccent: Color {
        return Color(r: 0, g: 96, b: 120)
    }

    static var neutral: Color {
        return Color(r: 216, g: 216, b: 216)
    }

    static var lightBackground: Color {
        return Color(r: 216, g: 192, b: 144)
    }

    static var darkBackground: Color {
        return Color(r: 144, g: 96, b: 72)
    }
}
