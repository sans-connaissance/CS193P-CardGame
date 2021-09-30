//
//  EmojiMemoryGame.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/29/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let vehicleTheme = ["✈️","🚀","🚗","🚜", "🛺", "🛻", "🛩", "🚤", "🛫", "⛴","🛵", "🧨","🚛","🚲","🚒","🏎","🚑","🚓","🚐","🏍","🚇","⛴","🚆","🚞"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            
            EmojiMemoryGame.vehicleTheme[pairIndex]
        }
    }
    
   @Published private var model: MemoryGame<String> = createMemoryGame()
   
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
