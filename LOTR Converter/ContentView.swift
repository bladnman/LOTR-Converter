//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Matt Maher on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
    
    var body: some View {
        ZStack {
            // background
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                // currency exchange section
                HStack {
                    // left
                    VStack {
                        // currency
                        HStack {
                            // currency image
                            Image(CurrencyImage.allCases[
                                Currency.allCases.firstIndex(of: leftCurrency)!
                            ].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // text
                            Text(CurrencyText.allCases[
                                Currency.allCases.firstIndex(of: leftCurrency)!
                            ].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        // text field
                        TextField("Amount", text: $leftAmount)
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                    }
                    // eq
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    // right
                    VStack {
                        // currency
                        HStack {
                            // currency image
                            Image(CurrencyImage.allCases[
                                Currency.allCases.firstIndex(of: rightCurrency)!
                            ].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // text
                            Text(CurrencyText.allCases[
                                Currency.allCases.firstIndex(of: rightCurrency)!
                            ].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        // text field
                        TextField("Amount", text: $rightAmount)
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(15)
                
                Spacer()
                
                // info button
                HStack {
                    Spacer()

                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
