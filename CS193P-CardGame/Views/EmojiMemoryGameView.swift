//
//  ContentView.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/26/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var gameVM: EmojiMemoryGame
    
    
    var body: some View {
        
        VStack {
            Text(gameVM.themeName).font(.largeTitle)
            Text("\(gameVM.score)")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(gameVM.cards) { card in
                        CardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                gameVM.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(gameVM.themeColor)
            .padding(.horizontal)
            .font(.largeTitle)
            newGame
        }
    }
    
    
    
    
    var newGame: some View {
        
        Button {
            gameVM.newGame()
        } label: {
            Text("New Game").font(.largeTitle)
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(gameVM: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(gameVM: game)
            .preferredColorScheme(.dark)
    }
}
