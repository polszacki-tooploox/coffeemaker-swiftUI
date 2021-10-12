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
                    Text(viewModel.name)
                        .font(.defaultFont(size: 25.0, weight: .semibold))
                        .foregroundColor(.white)
                    Text(viewModel.roasteryName)
                        .font(.defaultFont(size: 16.0, weight: .regular))
                        .foregroundColor(.white)
                    Spacer()
                    Text(viewModel.lastBrewText)
                        .font(.defaultFont(size: 14.0, weight: .regular))
                        .foregroundColor(.white.opacity(0.8))
                }
                Spacer()
                Image("arrow")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .gesture(
            TapGesture()
                .onEnded {
                    viewModel.onTapped()
                }
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/))
    }
}
