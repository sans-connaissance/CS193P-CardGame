//
//  MemoryGame.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/28/21.
//

import Foundation

struct MemoryGame <CardContent> where CardContent: Equatable {
   
    private(set) var cards: Array<Card>
    private(set) var score = 0
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {cards.indices.filter({ cards[$0].isFaceUp}).oneAndOnly}
        set {cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue)}}
    }
    
    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                    
                } else {
                    if cards[chosenIndex].hasAlreadyBeenSeen || cards[potentialMatchIndex].hasAlreadyBeenSeen {
                        score -= 1
                    }
                   
                }
                cards[chosenIndex].isFaceUp = true
                cards[chosenIndex].hasAlreadyBeenSeen = true
            } else {
                
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
 
        }
        
    }
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        let id: Int
        var isFaceUp = false
        var isMatched = false
        var hasAlreadyBeenSeen = false
        let content: CardContent
    }

}

extension Array {
    var oneAndOnly: Element? {
//self refers to the Array
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
