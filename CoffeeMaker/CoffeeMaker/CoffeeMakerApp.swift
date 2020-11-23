//
//  CoffeeMakerApp.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import SwiftUI

@main
struct CoffeeMakerApp: App {
    var body: some Scene {
        WindowGroup {
            CoffeeListConnector().coffeeListView()
        }
    }
}
