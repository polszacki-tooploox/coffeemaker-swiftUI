//
//  CoffeesList.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import SwiftUI
import Domain

extension Coffee: Identifiable {
    public var id: String { name }
}

struct CoffeesList: View {

    @ObservedObject private var viewModel: CoffeesListViewModel

    init(viewModel: CoffeesListViewModel) {
      self.viewModel = viewModel
    }


    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataSource, content: {
                    Text($0.name)
                })
            }
            .navigationTitle(viewModel.title)
        }
    }
}

struct CoffeesList_Previews: PreviewProvider {
    static var previews: some View {
        CoffeesList(viewModel: CoffeesListViewModel(
                        getAllCofffees: GetAllCoffees(),
                        addCoffee: AddCoffee(),
                        removeCoffee: RemoveCoffee()
        ))
    }
}
