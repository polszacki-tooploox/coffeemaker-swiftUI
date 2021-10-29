//
//  CoffeeMakerApp.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import SwiftUI
import Domain

@main
struct CoffeeMakerApp: App {

    init() {
        setupGlobalUIAppearance()
    }

    @ViewBuilder
    var body: some Scene {
        WindowGroup {
            BaseView()
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
