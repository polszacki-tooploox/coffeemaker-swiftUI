//
//  CoffeeMakerApp.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import SwiftUI

@main
struct CoffeeMakerApp: App {

    @ObservedObject var rootConnector = RootConnector()

    init() {
        setupGlobalUIAppearance()
    }

    @ViewBuilder
    var body: some Scene {
        WindowGroup {
            TestView()

//            switch rootConnector.appState {
//            case .coffeesList:
//                ViewsConstructor.coffeeListView(rootConnector: rootConnector)
//            case .addCoffee:
//                ViewsConstructor.addCoffeeView(rootConnector: rootConnector)
//            }
        }
    }

    private func setupGlobalUIAppearance() {
        UITableView.appearance().backgroundColor = .clear

        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()

        let globalAppearance = UINavigationBar.appearance()
        globalAppearance.scrollEdgeAppearance = appearance
        globalAppearance.compactAppearance = appearance
        globalAppearance.standardAppearance = appearance
    }
}
