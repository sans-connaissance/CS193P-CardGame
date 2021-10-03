//
//  CS193P_CardGameApp.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 9/26/21.
//

import SwiftUI

@main
struct CS193P_CardGameApp: App {
    
   private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
