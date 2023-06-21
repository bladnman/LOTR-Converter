//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Matt Maher on 6/20/23.
//

import SwiftUI

struct ContentView: View {
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
                            Image("silverpiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        // text field
                        Text("Text Field")
                        
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
                            Image("goldpiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // text
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        // text field
                        Text("Text Field")
                    }
                }
                
                // info button
                
                
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
