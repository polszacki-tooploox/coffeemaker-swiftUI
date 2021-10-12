//
//  NavigationBarStyling.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 07/10/2021.
//

import SwiftUI

extension View {
    func navigationBarTitleHidden() -> some View {
        navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Rectangle()
                        .foregroundColor(.clear)
                }
            }
    }
}
