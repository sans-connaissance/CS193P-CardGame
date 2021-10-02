//
//  EmojiMemoryGame.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/29/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    
    static var themes: [Theme] = [
        Theme(name: "vehicleTheme", emojis: ["✈️","🚀","🚗","🚜", "🛺", "🛻", "🛩", "🚤", "🛫", "⛴","🛵", "🧨","🚛","🚲","🚒","🏎","🚑","🚓","🚐","🏍","🚇","⛴","🚆","🚞"], pairs: 6, color: "Red"),
        Theme(name: "techTheme", emojis: ["📱", "🎚", "📞", "☎️", "🖥", "🕹", "🔌", "🖱", "⌨️", "📽"], pairs: 20, color: "Blue"),
        Theme(name: "sportTheme", emojis: ["⚽️", "🏈", "⛳️", "⛸", "🥍", "🥏", "🏸", "🥎", "🏉", "🏹"], pairs: 10, color: "Yellow")
        
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.pairs) { pairIndex in
            
            return theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame(theme: themes[1])
    
    private var theme: Theme
    
    var themeName: String {
        
        switch theme.name {
        case "vehicleTheme":
            return "Vehicles"
        case "sportTheme":
            return "Sports"
        case "techTheme":
            return "Technology"
        default:
            return "D'oh!"
        }
        
    }
    
    var themeColor: Color {
        switch theme.color {
        case "Red":
            return .red
        case "Blue":
            return .blue
        case "Yellow":
            return .yellow
            
        default:
            return .pink
        }
    }
    
    var score: Int {
        return model.score
    }
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
