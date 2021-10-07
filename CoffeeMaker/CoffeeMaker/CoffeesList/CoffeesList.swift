//
//  CoffeesList.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import SwiftUI
import Domain

extension Coffee: Identifiable {}

struct CoffeesList: View {
    @ObservedObject private var viewModel: CoffeesListViewModel

    private let activeCoffeeViewModel: ActiveCoffeeViewModel

    init(viewModel: CoffeesListViewModel, activeCoffeeViewModel: ActiveCoffeeViewModel) {
        self.viewModel = viewModel
        self.activeCoffeeViewModel = activeCoffeeViewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                ActiveCoffeeView(viewModel: activeCoffeeViewModel)
                    .padding()
                    .frame(height: 150.0, alignment: .center)
                List {
                    ForEach(viewModel.coffees, content: { item in
                        HStack {
                            Image(systemName: "airplayvideo")
                                .frame(width: 45.0, height: 45.0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .cornerRadius(5.0)
                            Text(item.name)
                                .padding([.leading, .trailing], 10.0)
                        }
                    }).onDelete(perform: delete)
                }
                NavigationLink(
                    destination: viewModel.addCoffeeView) {
                    Text("Add coffee")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(NavigationBarConfigurator { vc in
                let navBarAppearance = UINavigationBarAppearance()
                navBarAppearance.backgroundColor = .white
                navBarAppearance.shadowColor = nil
                navBarAppearance.shadowImage = nil
                vc.navigationBar.standardAppearance = navBarAppearance
            })
        }
    }

    private func delete(offsets: IndexSet) {
        viewModel.deleteItems(indices: offsets)
    }
}

struct CoffeesList_Previews: PreviewProvider {
    static var previews: some View {
        let mockUseCase = MockedCoffeeUseCase()
        let viewModel = CoffeesListViewModel(dependencies:
                                                .init(
                                                    getAllCofffees: mockUseCase,
                                                    getSelectedCoffee: mockUseCase,
                                                    setSelectedCoffee: mockUseCase,
                                                    deleteCoffee: mockUseCase,
                                                    connector: CoffeeListConnector()
                                                )
        )

        let activeCoffeeViewModel = ActiveCoffeeViewModel(getSelectedCoffee: mockUseCase)
        CoffeesList(viewModel: viewModel, activeCoffeeViewModel: activeCoffeeViewModel)
            .previewDevice("iPhone 12 Pro")
    }
}
