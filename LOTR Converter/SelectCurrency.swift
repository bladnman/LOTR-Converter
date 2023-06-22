//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Matt Maher on 6/21/23.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency

    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)

            VStack {
                Text("Select the currency you are starting with:")
                    .bold()
                    .multilineTextAlignment(.center)

                CurrencyGrid(activeCurrency: $leftCurrency)

                Text("Select the currency you would like to convert to:")
                    .bold()
                    .multilineTextAlignment(.center)

                CurrencyGrid(activeCurrency: $rightCurrency)

                Button("Done") {
                    dismiss()
                }
                .font(.title)
                .padding(8)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(7)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurrency: .constant(.silverPiece),
                       rightCurrency: .constant(.goldPiece))
    }
}

struct CurrencyGrid: View {
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Binding var activeCurrency: Currency

    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(0 ..< Currency.allCases.count, id: \.self) { idx in
                CoinTile(
                    label: CurrencyText.allCases[idx].rawValue,
                    imageName: CurrencyImage.allCases[idx].rawValue,
                    currency: Currency.allCases[idx],
                    activeCurrency: $activeCurrency,
                    onTap: {
                        $activeCurrency.wrappedValue = Currency.allCases[idx]
                    }
                )
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}

struct CurrencyGrid_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyGrid(
            activeCurrency: .constant(.silverPiece)
        )
        .previewLayout(.sizeThatFits)
    }
}

struct CoinTile: View {
    @State var label: String
    @State var imageName: String
    @State var currency: Currency

    @Binding var activeCurrency: Currency

    var onTap: () -> Void

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
            VStack {
                Spacer()
                Text(label)
                    .padding(3)
                    .font(.caption)
                    .background(.brown.opacity(0.75))
            }
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25)
        .if(currency == $activeCurrency.wrappedValue) { view in
            view.overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 3)
                    .opacity(0.5)
            )
            .shadow(color: .black, radius: 5)
        }
        .onTapGesture {
            onTap()
        }
    }
}

struct CoinTile_Previews: PreviewProvider {
    static var previews: some View {
        CoinTile(
            label: "Gold Penny",
            imageName: "goldpenny",
            currency: .silverPenny,
            activeCurrency: .constant(.goldPenny),
            onTap: {
                // noop
            }
        )
        .previewLayout(.sizeThatFits)
    }
}
