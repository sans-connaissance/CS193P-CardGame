//
//  ContentView.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/26/21.
//

import SwiftUI

struct ContentView: View {
    
    //for homework maybe make this an @State variable
    var emojis = ["✈️","🚀","🚗","🚜", "🛺", "🛻", "🛩", "🚤", "🛫", "⛴","🛵", "🧨","🚛","🚲","🚒","🏎","🚑","🚓","🚐","🏍","🚇","⛴","🚆","🚞"]
    
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            HStack {
                
                remove
                Spacer()
                add
                
                
            }.padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
    }
    //whoa -- this is amazing
    var remove: some View {
        Button(action: {
            emojiCount -= 1
        }, label: {
            
            VStack {
                Text("Remove")
                Text("Card")
            }
            
        })
    }
    
    var add: some View {
        Button(action: {
            emojiCount += 1
        }, label: {
            VStack {
                Text("Add")
                Text("Card")
            }
            
        })
    }
}



struct CardView: View {
    
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        
        ZStack{
            //local variables are cool
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
