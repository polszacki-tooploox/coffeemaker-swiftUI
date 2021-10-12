//
//  CoffeesListCell.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 12/10/2021.
//

import SwiftUI
import Domain

struct CoffeesListCell: View {
    let coffee: Coffee

    var body: some View {
        HStack {
            Color.purple
                .frame(width: 20.0)
            VStack(alignment: .leading, spacing: 5.0) {
                Text(coffee.name)
                    .font(.defaultFont(size: 18.0, weight: .regular))
                Text(coffee.roasteryName)
                    .font(.defaultFont(size: 16.0, weight: .light))

            }
            .padding()
        }
    }
}

struct CoffeesListCell_Previews: PreviewProvider {
    static var previews: some View {
        CoffeesListCell(coffee: Coffee.mocked)
    }
}
