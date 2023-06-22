//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by Matt Maher on 6/21/23.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)

            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .padding()

                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()

                ExchangeRate(label: "1 Gold Piece = 4 Gold Pennies",
                             leftImage: "goldpiece",
                             rightImage: "goldpenny")

                ExchangeRate(label: "1 Gold Penny = 4 Silver Pennies",
                             leftImage: "goldpenny",
                             rightImage: "silverpiece")

                ExchangeRate(label: "1 Silver Penny = 4 Silver Pennies",
                             leftImage: "silverpiece",
                             rightImage: "silverpenny")

                ExchangeRate(label: "1 Silver Penny = 100 Copper Pennies",
                             leftImage: "silverpenny",
                             rightImage: "copperpenny")

                Button("Done") {
                    dismiss()
                }
                .font(.title)
                .padding(8)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(7)
            }
            .padding()
        }
        .foregroundColor(.black)
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
    }
}

struct ExchangeRate: View {
    @State var label: String
    @State var leftImage: String
    @State var rightImage: String

    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)

            Text(label)

            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(label: "1 Gold Pieces = 4 Gold Pennies",
                     leftImage: "goldpiece",
                     rightImage: "goldpenny")
            .previewLayout(.sizeThatFits)
    }
}
