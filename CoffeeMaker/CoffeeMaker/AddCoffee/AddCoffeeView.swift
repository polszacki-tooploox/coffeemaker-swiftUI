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
            VStack(alignment: .leading) {
                Text(viewModel.labelText)
                TextField("Enter coffee name", text: Binding<String>(
                            get: { viewModel.coffeeName ?? "" },
                            set: { viewModel.coffeeName = $0 }))
                Spacer()
                HStack{
                    Spacer()
                    Button("Add", action: {
                        viewModel.addTapped()
                    })
                    .frame(width: 300.0, height: 60.0)
                    .disabled(viewModel.coffeeName?.isEmpty ?? true)
                    Spacer()
                }
            }.padding(.all)
        }
        .navigationTitle(viewModel.title)
        .onReceive(viewModel.$shouldDimiss, perform: { shouldDismiss in
            if shouldDismiss {
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

struct AddCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListConnector().addCoffeeView()
    }
}
