//
//  Theme.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 10/1/21.
//

import Foundation

struct Theme {
    
    var name: String
    var emojis: [String]
    var pairs: Int
    var color: String
    
    init(name: String, emojis: [String], pairs: Int, color: String) {
        
        self.name = name
        self.emojis = emojis
        self.pairs = pairs > emojis.count ? emojis.count : pairs
        self.color = color
    }
    
}
