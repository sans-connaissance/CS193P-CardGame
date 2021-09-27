//
//  ContentView.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/26/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
            CardView()
            
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}



struct CardView: View {
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            
            Text("✈️")
                .font(.largeTitle)
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
