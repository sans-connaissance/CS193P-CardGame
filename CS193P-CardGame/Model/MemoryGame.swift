//
//  MemoryGame.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/28/21.
//

import Foundation

struct MemoryGame <CardContent> {
    private(set)var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
//        if let chosenIndex = cards.firstIndex(where: { aCardInTheCardsArray in aCardInTheCardsArray.id == card.id
        // simplified version is:
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }

    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    
    
}
