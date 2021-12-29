//
//  AddCoffeeView.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 04/12/2020.
//

import SwiftUI

struct AddCoffeeView: View {
    @ObservedObject private var viewModel: AddCoffeeViewModel
    @Environment(\.presentationMode) var presentationMode

    init(viewModel: AddCoffeeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.lightBackground
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                contentView
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Add Coffee")
                }

                ToolbarItem(placement: .navigation) {
                    Button(action: viewModel.backSelected) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                            Text("Back")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }

    private var contentView: some View {
        VStack(alignment: .leading, spacing: 40.0) {
            VStack(alignment: .leading) {
                Text("Coffee name:")
                TextField("Enter coffee name", text: $viewModel.coffeeName)
            }
            VStack(alignment: .leading) {
                Text("Roastery name")
                TextField("Enter roastery name", text: $viewModel.roasteryName)
            }
            ColorPicker("Set a color to identify the coffee easier", selection: $viewModel.coffeeColor)
            Spacer()
            HStack{
                Spacer()
                Button("Add", action: {
                    viewModel.addTapped()
                })
                    .frame(width: 300.0, height: 60.0)
                    .disabled(viewModel.coffeeName.isEmpty)
                Spacer()
            }
        }.padding(.all)
    }
}

struct AddCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        let addCoffeeViewModel = AddCoffeeViewModel(store: .mocked)
        AddCoffeeView(viewModel: addCoffeeViewModel)
    }
}
