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
        GeometryReader { geometry in
            ZStack{
                //local variables are cool
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.corderRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let corderRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
        
    }
}

struct CardView_Previews: PreviewProvider {
    
    let card = EmojiMemoryGame.Card.self
    
    static var previews: some View {
        
        CardView(EmojiMemoryGame.Card(id: 1, isFaceUp: true, isMatched: false, hasAlreadyBeenSeen: false, content: "8"))
    }
}
