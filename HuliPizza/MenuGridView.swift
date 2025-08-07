//
//  MenuGridView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-08-05.
//

import SwiftUI

struct MenuGridView: View {
    var menu:[MenuItem]
    @Binding var selectedItem: MenuItem
    @State private var favorites = Favorites().favorites
    let columnLayout = Array(repeating: GridItem(spacing: 10), count: 2)
    var body: some View {
        VStack{
            FavoritesGridView(favorites: $favorites, selected: $selectedItem)
                .background(.regularMaterial)
            //Text(selectedItem.name)
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(
                        Favorites.excluded(from: menu, by: favorites)
                    ){ item in
                        MenuItemTileView(menuItem: item)
                        // Order of gesture is matter and important, be careful!
                            .onTapGesture(count: 2) {
                                if !favorites.contains(where: {$0.id == item.id}){
                                    favorites.append(item)
                                }
                            }
                            .onTapGesture {
                                selectedItem = item
                            }
                            .onLongPressGesture {
                                selectedItem = noMenuItem
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu, selectedItem: .constant(noMenuItem))
}
