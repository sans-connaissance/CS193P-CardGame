//
//  CardView.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 10/3/21.
//

import SwiftUI

struct CardView: View {
    
    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        
        ZStack{
            //local variables are cool
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
                
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

//struct CardView_Previews: PreviewProvider {
//    
//    let card = EmojiMemoryGame.Card
//    
//    static var previews: some View {
//        
//        CardView(card: card.init(id: 2, content: "") )
//    }
//}
