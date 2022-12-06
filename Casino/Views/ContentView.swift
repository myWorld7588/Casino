//
//  ContentView.swift
//  Casino
//
//  Created by Jake Choi on 12/5/22.
//

import SwiftUI

// MARK: - PROPERTY


struct ContentView: View {
    
    // MARK: - BODY
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // MARK: - BACKGROUND
            
            // MARK: - INTERFACE
            
            
            
            VStack(alignment: .center, spacing: 5) {
                // MARK: - HEADER
                
                LogoView()
                
                Spacer()
                
                
                // MARK: - SCORE
                
                HStack {
                    Text("Your\nCoins".uppercased())
                        .foregroundColor(Color.white)
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                    
                    Text("100")
                        .foregroundColor(Color.white)
                        .font(.system(.title, design: .rounded, weight: .heavy))
                        .shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 3)
                        .layoutPriority(1)
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .frame(minWidth: 128)
                .background(
                    Capsule().foregroundColor(Color("ColorTransparentBlack"))
                )
                
                // MARK: - SLOT MACHINE
                // MARK: - FOOTER
                
                Spacer()
                
            }
            // MARK: - BUTTON
            .overlay(
                // RESET
                Button(action: {
                    print("Reset the Game")
                }) {
                    Image(systemName: "arrow.2.circlepath.circle")
                }
                    .modifier(ButtonModifier()),
                alignment: .topLeading)
            .overlay(
                // INFO
                Button(action: {
                    print("Info View")
                }) {
                    Image(systemName: "info.circle")
                }
                    .modifier(ButtonModifier()),
                alignment: .topTrailing)
            
            .padding()
            .frame(maxWidth: 720)
            
            // MARK: - POPUP
            
        } //: ZSTACK
    }
}


// MARK: - PREVIEW


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
