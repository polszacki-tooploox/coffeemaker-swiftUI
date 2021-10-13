//
//  ColorRGB+Color.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 13/10/2021.
//

import UIKit
import SwiftUI
import Domain

extension ColorRGB {
    func toColor() -> Color {
        Color(r: red, g: green, b: blue, a: alpha)
    }
}

extension Color {
    func toColorRGB() -> ColorRGB {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0

        guard UIColor(self) .getRed(&r, green: &g, blue: &b, alpha: &a) else {
            // You can handle the failure here as you want
            return ColorRGB(red: 0, green: 0, blue: 0, alpha: 0)
        }

        return ColorRGB(red: Int(r * 255), green: Int(g * 255), blue: Int(b * 255), alpha: Int(a * 255))
    }
}
