//
//  AddCoffeeViewModel.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 10/12/2020.
//

import Combine
import Domain
import SwiftUI

final class AddCoffeeViewModel: ObservableObject, Identifiable {

    @EnvironmentObject var store: AppStore
    @State var coffeeColor = Color.red
    @Published var coffeeName: String = ""
    @Published var roasteryName: String = ""

    private(set) lazy var isSubmittable: AnyPublisher<Bool, Never> = {
        $coffeeName.combineLatest($roasteryName)
            .map {
                !$0.0.isEmpty && !$0.1.isEmpty
            }
            .eraseToAnyPublisher()
    }()


    private var disposables = Set<AnyCancellable>()

    func addTapped() {
//        let coffee = Coffee(
//            id: UUID().uuidString,
//            name: coffeeName,
//            roasteryName: roasteryName,
//            color: coffeeColor.toColorRGB(),
//            imagePath: nil,
//            brewings: []
//        )
//        disposables.insert(dependencies.addCoffee.add(coffee: coffee)
//                            .sink(receiveCompletion: { [weak self] completion in
//                                switch completion {
//                                case .finished:
//                                    self?.backSelected()
//                                    print("Coffee added")
//                                case .failure(let error):
//                                    print(error.localizedDescription)
//                                }
//                            }, receiveValue: { _ in }))
    }

    func backSelected() {
//        dependencies.connector.updateState(.coffeesList)
    }
}
