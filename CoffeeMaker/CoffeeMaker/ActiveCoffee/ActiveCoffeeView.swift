//
//  ActiveCoffeeView.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 05/10/2021.
//

import SwiftUI
import Domain

struct ActiveCoffeeView: View {
    @ObservedObject private var viewModel: ActiveCoffeeViewModel

    init(viewModel: ActiveCoffeeViewModel) {
      self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 10.0) {
                    Text(viewModel.selectedCoffee?.name ?? "Test coffee").font(.headline)
                    Text("Bonanza").font(.caption)
                    Text("Last shot: 16g/32g 28s").font(.caption2)
                }
                Image("arrow")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
            }
        }
        .padding()
        .background(Color.darkBackground)
        .cornerRadius(15.0)
    }
}

struct ActiveCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ActiveCoffeeViewModel()
        return ActiveCoffeeView(viewModel: viewModel)
    }
}
