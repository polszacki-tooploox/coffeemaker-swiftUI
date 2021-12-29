//
//  BaseView.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 26/10/2021.
//

import SwiftUI
import Domain
import Data

struct BaseView: View {

    @ObservedObject var appStore = AppStore(
        initial: AppState(
            coffeeList: .init(coffees: [
                Coffee.mocked, Coffee.mocked], selecetedCoffeeId: nil),
            addCoffee: .init(),
            navigationState: .coffeeList
        ),
        reducer: appReducer,
        middlewares: [
            listenToChangingSelectedCoffee(using: UserDefaultsSelectedCoffeeRepository()),
            changeSelectedCoffee(using: UserDefaultsSelectedCoffeeRepository())
        ])

    init() {
        appStore.dispatch(.coffeeListAction(.initial))
    }

    @ViewBuilder
    var body: some View {
        switch appStore.state.navigationState {
        case .coffeeList:
            ViewsConstructor.coffeeListView(store: appStore)
                .transition(.move(edge: .leading))
        case .addCoffee:
            ViewsConstructor.addCoffeeView(store: appStore)
                .transition(.move(edge: .trailing))
        default:
            Text("Test")
        }
    }
}


struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
