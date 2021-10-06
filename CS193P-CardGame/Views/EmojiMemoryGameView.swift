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
            
            AspectVGrid(items: gameVM.cards, aspectRatio: 2/3, content: { card in
                
                cardView(for: card)
            })
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
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card)
                .padding(4)
                .onTapGesture {
                    gameVM.choose(card)
                }
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
