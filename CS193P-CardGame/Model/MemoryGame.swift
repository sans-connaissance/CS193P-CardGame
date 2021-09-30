//
//  MemoryGame.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/28/21.
//

import Foundation

struct MemoryGame <CardContent> {
    private(set)var cards: Array<Card>
    
    func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        var chosenCard = cards[chosenIndex]
        chosenCard.isFaceUp.toggle()
    
        
    }
    
    func index(of: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == of.id {
                return index
            }
        }
        return 0 // not correct
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
