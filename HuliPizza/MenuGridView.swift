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
            Text("Favorites")
                .opacity(favorites.isEmpty ? 0 : 1)
            FavoritesGridView(favorites: $favorites, selected: $selectedItem)
                .background(.regularMaterial)
            // Implicit: Only animates the specific view, and you can animate different properties independently
            // Always specify the value parameter with .animation to avoid performance issues
                .animation(.easeIn(duration: 1.5), value: favorites)
            //Text(selectedItem.name)
            Text("Menu")
                .opacity(favorites.isEmpty ? 0 : 1)
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(
                        Favorites.excluded(from: menu, by: favorites)
                    ){ item in
                        MenuItemTileView(menuItem: item)
                        // Order of gesture is matter and important, be careful!
                            .onTapGesture(count: 2) {
                                if !favorites.contains(where: {$0.id == item.id}){
                // Explicit: withAnimation doesn't animate "all views" - it only animates views that depend on the state variables you change inside the closure.
                                    withAnimation(.default) {
                                        favorites.append(item)
                                    }
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
            .animation(.spring(duration: 1.5, bounce: 0.2), value: favorites)
        }
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu, selectedItem: .constant(noMenuItem))
}
