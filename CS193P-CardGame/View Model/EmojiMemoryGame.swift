//
//  EmojiMemoryGame.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/29/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    

    static var themes: [Theme] = [
    Theme(name: "vehicleTheme", emojis: ["✈️","🚀","🚗","🚜", "🛺", "🛻", "🛩", "🚤", "🛫", "⛴","🛵", "🧨","🚛","🚲","🚒","🏎","🚑","🚓","🚐","🏍","🚇","⛴","🚆","🚞"], pairs: 6, color: "Red"),
    Theme(name: "techTheme", emojis: ["📱", "🎚", "📞", "☎️", "🖥", "🕹", "🔌", "🖱", "⌨️", "📽"], pairs: 20, color: "Blue"),
    Theme(name: "sportTheme", emojis: ["⚽️", "🏈", "⛳️", "⛸", "🥍", "🥏", "🏸", "🥎", "🏉", "🏹"], pairs: 10, color: "Yellow")
        
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.pairs) { pairIndex in
            
            var randomEmojis: [String] = []
            var preparedEmojis: [String] = []
            
            for emoji in theme.emojis {
                randomEmojis.append(emoji)
                
            }
           var reduceEmojis = randomEmojis.shuffled()
            
            
            for _ in 0..<(theme.pairs - reduceEmojis.count){
                if let poppedEmoji = reduceEmojis.popLast() {
                    preparedEmojis.append(poppedEmoji)
                }
            }
            
            
            return preparedEmojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame(theme: themes[1])
   
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
