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
            ZStack {
                Color.lightBackground
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                contentView
            }
            .navigationBarTitleHidden()
        }
    }

    private var contentView: some View {
        VStack {
            ActiveCoffeeView(viewModel: activeCoffeeViewModel)
                .padding(.horizontal)
                .frame(height: 150.0, alignment: .center)
            coffeesList
            addCoffeeButton
        }
    }

    private var coffeesList: some View {
        List {
            ForEach(viewModel.coffees) { coffee in
                CoffeesListCell(coffee: coffee)
                    .cornerRadius(14.0)
                    .onTapGesture {
                        viewModel.selectedCoffee(coffee: coffee)
                    }
            }
            .onDelete(perform: delete)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
    }

    private var addCoffeeButton: some View {
        Button(action: {
            withAnimation {
                viewModel.addCoffeeSelected()
            }
        }) {
            Text("Add coffee")
                .font(Font.defaultFont(size: 20.0, weight: .semibold))
                .frame(maxWidth: 200)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(Color.darkAccent)
    }

    private func delete(offsets: IndexSet) {
        // TODO
    }
}

struct CoffeesList_Previews: PreviewProvider {
    static var previews: some View {
        let mockUseCase = MockedCoffeeUseCase(mockSelectedCoffeeId: Coffee.mocked.id, mockCoffees: [Coffee.mocked, Coffee.mocked, Coffee.mocked])
        let viewModel = CoffeesListViewModel(dependencies:
                                                .init(
                                                    getAllCofffees: mockUseCase,
                                                    getSelectedCoffee: mockUseCase,
                                                    setSelectedCoffee: mockUseCase,
                                                    deleteCoffee: mockUseCase,
                                                    connector: RootConnector()
                                                )
        )

        let activeCoffeeViewModel = ActiveCoffeeViewModel(getSelectedCoffee: mockUseCase)
        CoffeesList(viewModel: viewModel, activeCoffeeViewModel: activeCoffeeViewModel)
            .previewDevice("iPhone 13 Pro")
    }
}
