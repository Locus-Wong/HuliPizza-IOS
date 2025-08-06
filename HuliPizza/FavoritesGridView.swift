//
//  FavoritesGridView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-08-05.
//

import SwiftUI

struct FavoritesGridView: View {
    @State var menu:[MenuItem]
    @State var selectedItem: MenuItem = noMenuItem
    @State var favourites:[MenuItem] = Favorites().favorites
    let columnLayout = Array(repeating: GridItem(), count: 5)
    var body: some View {
        LazyVGrid(columns: columnLayout) {
            ForEach(menu){ item in
                FavoriteCellView(menuItem: item)
                    .onTapGesture(count: 1, perform: {
                        // add for purchase
                        
                    })
                    .onTapGesture(count: 2) {
                        // add to favourite
                        selectedItem = item
                        favourites.append(selectedItem)
                    }
                    .onLongPressGesture {
                        // remove from favorite
                        selectedItem = item
                        favourites.filter({$0.})
                    }
            }
        }
    }
}

#Preview {
    FavoritesGridView(menu: MenuModel().menu)
}
