//
//  Theme.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 10/1/21.
//

import Foundation

struct Theme {
    
    private(set) var name: String
    private(set) var pairs: Int
    private(set) var color: String
    
    var emojis: [String]
    
    init(name: String, emojis: [String], pairs: Int, color: String) {
        
        self.name = name
        self.emojis = emojis
        self.pairs = pairs > emojis.count ? emojis.count : pairs
        self.color = color
    }
    
}
