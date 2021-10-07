//
//  Font+CoffeeMaker.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 07/10/2021.
//

import SwiftUI

enum CoffeeFontWeight: String {
    case light, regular, semibold, bold
}

extension Font {

    private static var sfFontName: String {
        return "SFProDisplay-"
    }

    static func defaultFont(size: Double, weight: CoffeeFontWeight) -> Font {
        Font.custom(sfFontName + weight.rawValue.capitalized, size: CGFloat(size))
    }
}
