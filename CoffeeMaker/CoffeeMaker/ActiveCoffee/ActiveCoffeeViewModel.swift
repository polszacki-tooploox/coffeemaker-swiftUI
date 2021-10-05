//
//  ActiveCoffeeViewModel.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 05/10/2021.
//

import Combine
import Domain

final class ActiveCoffeeViewModel: ObservableObject, Identifiable {

    @Published var selectedCoffee: Coffee?
}
