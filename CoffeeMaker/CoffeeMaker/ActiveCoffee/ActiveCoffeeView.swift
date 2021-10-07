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
                    Text(viewModel.name).font(.headline)
                    Text(viewModel.roasteryName).font(.caption)
                    Text(viewModel.lastBrewText).font(.caption2)
                }
                Image("arrow")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
            }
        }
        .gesture(
            TapGesture()
                .onEnded {
                    viewModel.onTapped()
                }
        )
        .padding()
        .background(Color.darkBackground)
        .cornerRadius(15.0)
    }
}

struct ActiveCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        let getSelectedCoffee = MockedCoffeeUseCase()
        let viewModel = ActiveCoffeeViewModel(
            getSelectedCoffee: getSelectedCoffee
        )
        return ActiveCoffeeView(viewModel: viewModel)
    }
}
