//
//  CoffeesListCell.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 12/10/2021.
//

import SwiftUI
import Domain

struct CoffeesListCell: View {
    let coffee: CoffeeListItem

    var body: some View {
        ZStack {
            if coffee.isSelected {
                coffee.color.opacity(0.2)
            }
            HStack {
                coffee.color
                    .frame(width: 20.0)
                VStack(alignment: .leading, spacing: 5.0) {
                    Text(coffee.mainText)
                        .font(.defaultFont(size: 18.0, weight: .regular))
                    Text(coffee.detailText)
                        .font(.defaultFont(size: 16.0, weight: .light))
                }
                .padding(.vertical, 10.0)
                .padding(.leading, 5.0)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct CoffeesListCell_Previews: PreviewProvider {
    static var previews: some View {
            CoffeesListCell(coffee: CoffeeListItem(coffee: Coffee.mocked, isSelected: false))
                .frame(maxWidth: 300.0, maxHeight: 65.0, alignment: .leading)
                .background(Color.neutral)
    }
}
