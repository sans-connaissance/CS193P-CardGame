//
//  EmojiMemoryGame.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/29/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    
   private static var themes: [Theme] = [
        Theme(name: "vehicleTheme", emojis: ["โ๏ธ","๐","๐","๐", "๐บ", "๐ป", "๐ฉ", "๐ค", "๐ซ", "โด","๐ต", "๐งจ","๐","๐ฒ","๐","๐","๐","๐","๐","๐","๐","โด","๐","๐"], pairs: 6, color: "Red"),
        Theme(name: "techTheme", emojis: ["๐ฑ", "๐", "๐", "โ๏ธ", "๐ฅ", "๐น", "๐", "๐ฑ", "โจ๏ธ", "๐ฝ"], pairs: 20, color: "Blue"),
        Theme(name: "sportTheme", emojis: ["โฝ๏ธ", "๐", "โณ๏ธ", "โธ", "๐ฅ", "๐ฅ", "๐ธ", "๐ฅ", "๐", "๐น"], pairs: 10, color: "Yellow")
        
    ]
    
   private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.pairs) { pairIndex in
            
            return theme.emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame(theme: themes[1])
    
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
    
    var cards: [Card]{
        return model.cards
    }
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
   func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
