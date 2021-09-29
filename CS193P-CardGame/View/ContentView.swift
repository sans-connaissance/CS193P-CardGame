//
//  ContentView.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/26/21.
//

import SwiftUI

struct ContentView: View {
    
    //for homework maybe make this an @State variable
    @State var emojis = ["✈️","🚀","🚗","🚜", "🛺", "🛻", "🛩", "🚤", "🛫", "⛴","🛵", "🧨","🚛","🚲","🚒","🏎","🚑","🚓","🚐","🏍","🚇","⛴","🚆","🚞"]
    
    var vehicleTheme = ["✈️","🚀","🚗","🚜", "🛺", "🛻", "🛩", "🚤", "🛫", "⛴","🛵", "🧨","🚛","🚲","🚒","🏎","🚑","🚓","🚐","🏍","🚇","⛴","🚆","🚞"]
    var techTheme = ["📱", "🎚", "📞", "☎️", "🖥", "🕹", "🔌", "🖱", "⌨️", "📽"]
    var sportTheme = ["⚽️", "🏈", "⛳️", "⛸", "🥍", "🥏", "🏸", "🥎", "🏉", "🏹"]
    
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            Text("Memorize")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojis.count].shuffled(), id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }.foregroundColor(.red)
            }
            Spacer()
            HStack {
                
                // remove
                vehicleThemeButton
                Spacer()
                techThemeButton
                Spacer()
                sportThemeButton
                //  add
                
            }
            .font(.body)
            
            
        }
        .padding(.horizontal)
        .font(.largeTitle)
        
        
    }
    
    var vehicleThemeButton: some View {
        Button {
            emojis = vehicleTheme
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vechicles")

            }
        }
        
    }
    
    var techThemeButton: some View {
        Button {
            emojis = techTheme
        } label: {
            VStack {
                Image(systemName: "gamecontroller")
                Text("Games")

            }
        }
        
    }
    
    var sportThemeButton: some View {
        Button {
            emojis = sportTheme
        } label: {
            VStack {
                Image(systemName: "sportscourt")
                Text("Sports")

            }
        }
        
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
                shape.strokeBorder(lineWidth: 3)
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
