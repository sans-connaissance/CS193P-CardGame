//
//  AspectVGrid.swift
//  CS193P-CardGame
//
//  Created by David Malicke on 10/6/21.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where ItemView: View {
    
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

