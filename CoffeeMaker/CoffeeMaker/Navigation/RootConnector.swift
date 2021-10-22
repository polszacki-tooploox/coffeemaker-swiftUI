//
//  AppStateHolder.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 15/10/2021.
//

import Foundation
import SwiftUI
import Domain
import Data

final class RootConnector: ObservableObject {

    enum AppState {
        case coffeesList
        case addCoffee
    }

    @Published private(set) var rootView: AnyView = AnyView(EmptyView())
    @Published private(set) var appState: AppState = .coffeesList

    init() {
        updateState(.coffeesList)
    }

    func updateState(_ state: AppState) {
        appState = state
        switch state {
        case .coffeesList:
            rootView = AnyView(ViewsConstructor.coffeeListView(rootConnector: self))
            
        case .addCoffee:
            rootView = AnyView(ViewsConstructor.addCoffeeView(rootConnector: self))
        }
    }
}
