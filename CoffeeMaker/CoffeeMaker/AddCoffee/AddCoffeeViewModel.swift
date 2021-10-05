//
//  AddCoffeeViewModel.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 10/12/2020.
//

import Combine
import Domain

final class AddCoffeeViewModel: ObservableObject, Identifiable {

    @Published var title: String = "Add coffee"
    @Published var labelText: String = "Coffee name:"
    @Published var coffeeName: String?
    @Published var shouldDimiss: Bool = false

    struct Dependencies {
        let addCoffee: AddCoffee
    }

    private var disposables = Set<AnyCancellable>()
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func addTapped() {
        guard let coffeeName = coffeeName else {
            return
        }
        let coffee = Coffee(id: UUID().uuidString, name: coffeeName, imagePath: nil)
        disposables.insert(dependencies.addCoffee.add(coffee: coffee)
                            .sink(receiveCompletion: { [weak self] completion in
                                switch completion {
                                case .finished:
                                    self?.coffeeName = nil
                                    self?.shouldDimiss = true
                                    print("Coffee added")
                                    break
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                            }, receiveValue: { _ in }))
    }

    deinit {
        print("Blah")
    }
}
