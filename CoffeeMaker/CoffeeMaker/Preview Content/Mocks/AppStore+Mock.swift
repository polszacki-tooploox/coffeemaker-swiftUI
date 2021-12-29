//
//  AppStore+Mock.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 29/12/2021.
//

import Foundation
import SwiftUI
import Domain

extension AppStore {

    static var mocked: AppStore {
        AppStore(
            initial: AppState(
                coffeeList: .init(coffees: [
                    Coffee.mocked, Coffee.mocked], selecetedCoffeeId: nil),
                addCoffee: .init(),
                navigationState: .coffeeList
            ),
            reducer: appReducer,
            middlewares: []
        )
    }
}
