//
//  ContentView.swift
//  Casino
//
//  Created by Jake Choi on 12/5/22.
//

import SwiftUI





struct ContentView: View {
    // MARK: - PROPERTY
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    
    @State private var highscore: Int = 0
    @State private var coins: Int = 100
    @State private var betAmount: Int = 10
    @State private var reels: Array = [0, 1, 2]
    @State private var showingInfoView: Bool = false
    @State private var isActivateBet10: Bool = true
    @State private var isActivateBet20: Bool = false
    
    
    
    // FUNCTION
    
    
    //SpinsReels
    func spinReels() {
        // reels[0] = Int.random(in: 0...symbols.count - 1)
        // reels[1] = Int.random(in: 0...symbols.count - 1)
        // reels[2] = Int.random(in: 0...symbols.count - 1)
        reels = reels.map({ _ in
            Int.random(in: 0...symbols.count - 1)
        })
    }
    
    // CHECK THE WINNING
    
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2] && reels [0] == reels[2] {
            // PLAYER WINS
            playerWins()
            // NEW HIGH SCROES
            if coins > highscore {
                newHighScore()
            }
            
        } else {
            // PLAYER LOSES
            playerLoses()
        }
    }
    
    func playerWins() {
        coins += betAmount * 10
        
    }
    
    func newHighScore() {
        highscore = coins
    }
    
    func playerLoses() {
        coins -= betAmount
    }
    
    func activateBet20() {
        betAmount = 20
        isActivateBet20 = true
        isActivateBet10 = false
    }
    
    func activateBet10() {
        betAmount = 10
        isActivateBet10 = true
        isActivateBet20 = false
    }
    
    
    
    // GAME IS OVER
    

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
                    HStack {
                        Text("Your\nCoins")
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                            
                        
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                            
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highscore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                            
                        
                    }
                    .modifier(ScoreContainerModifier())
                }
                
                // MARK: - SLOT MACHINE
                
                VStack(alignment: .center, spacing: 0) {
                    // MARK: - REEL #1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        
                        Spacer()
                        
                        // MARK: - REEL #3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    // MARK: - SPIN BUTTON
                    Button(action: {
                        self.spinReels()
                        
                        // Check Winning
                        self.checkWinning()
                    }) {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                            
                    }
                    
                } //: SLOT MACHINE
                
                .layoutPriority(2)
                
                // MARK: - FOOTER
                
                Spacer()
                
                HStack {
                    // MARK: - BET 20
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            self.activateBet20()
                        }) {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(isActivateBet20 ? Color("ColorYellow") :  Color.white)
                                .modifier(BetNumberModifier())
                                
                        }
                        .modifier(BetCapsuleModifier())
                        
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActivateBet20 ? 1 : 0)
                            .modifier(CasinoChipModifier())
                        
                    }
                    
                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActivateBet10 ? 1 : 0)
                            .modifier(CasinoChipModifier())
                        
                        Button(action: {
                            self.activateBet10()
                        }) {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(isActivateBet10 ? Color("ColorYellow") :  Color.white)
                                .modifier(BetNumberModifier())
                                
                        }
                        .modifier(BetCapsuleModifier())
                        
                    }
                    
                }
                
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
                    self.showingInfoView = true
                }) {
                    Image(systemName: "info.circle")
                }
                    .modifier(ButtonModifier()),
                alignment: .topTrailing)
            
            .padding()
            .frame(maxWidth: 720)
            
            // MARK: - POPUP
            
        } //: ZSTACK
        
        .sheet(isPresented: $showingInfoView) {
            InfoView()
        }
    }
}


// MARK: - PREVIEW


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
