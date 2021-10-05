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
            VStack {
                List {
                    ForEach(viewModel.dataSource, content: { item in
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
            .navigationTitle(viewModel.title)
        }
    }

    private func delete(offsets: IndexSet) {
        viewModel.dele
        .remove(atOffsets: offsets)
    }
}

struct CoffeesList_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListConnector().coffeeListView()
    }
}
