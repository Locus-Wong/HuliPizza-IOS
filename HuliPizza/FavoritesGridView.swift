//
//  FavoritesGridView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-08-05.
//

import SwiftUI

struct FavoritesGridView: View {
    @Binding var favorites: [MenuItem]
    @Binding var selected: MenuItem
    let columnLayout = Array(repeating: GridItem(), count: 5)
   
    var body: some View {
        LazyVGrid(columns: columnLayout) {
            ForEach(favorites.sorted{ $0.id < $1.id }){ item in
                FavoriteCellView(menuItem: item)
                    .onTapGesture {
                        selected = item
                    }
                    .onLongPressGesture {
                        if let index = favorites.firstIndex(where: {$0.id == item.id}){
                            favorites.remove(at: index)
                        }
                    }
            }
        }
    }
}

#Preview {
    FavoritesGridView(
        favorites: .constant([noMenuItem, testMenuItem]),
        selected: .constant(noMenuItem)
    )
}
