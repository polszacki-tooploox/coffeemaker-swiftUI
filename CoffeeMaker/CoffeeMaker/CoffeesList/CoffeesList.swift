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

    private var contentView: some View {
        VStack {
            ActiveCoffeeView(viewModel: activeCoffeeViewModel)
                .padding()
                .frame(height: 150.0, alignment: .center)
            List {
                ForEach(viewModel.coffees, content: { item in
                    CoffeesListCell(coffee: item)
                        .cornerRadius(14.0)
                }).onDelete(perform: delete)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
            }
            .listRowSeparator(.hidden)
            .padding()
            Button(action: {}) {
                Text("Add coffee")
                    .font(Font.defaultFont(size: 20.0, weight: .semibold))
                    .frame(maxWidth: 200)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(Color.darkAccent)
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.lightBackground
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                contentView
            }
            .navigationBarTitleHidden()
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
            .previewDevice("iPhone 13 Pro")
    }
}
