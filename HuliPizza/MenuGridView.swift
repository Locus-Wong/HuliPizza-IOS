//
//  MenuGridView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-08-05.
//

import SwiftUI

struct MenuGridView: View {
    @Namespace private var nspace
    var menu:[MenuItem]
    @Binding var selectedItem: MenuItem
    @State private var favorites = Favorites().favorites
    let columnLayout = Array(repeating: GridItem(spacing: 10), count: 2)
    let columnLayout4 = Array(repeating: GridItem(spacing: 10), count: 4)
    var favoriteGridView : some View {
        LazyVGrid(columns: columnLayout4) {
            ForEach(favorites.sorted{ $0.id < $1.id }){ item in
                FavoriteCellView(menuItem: item)
                    .matchedGeometryEffect(id: item.id, in: nspace)
                    .onTapGesture {
                        selectedItem = item
                    }
                    .onLongPressGesture {
                        if let index = favorites.firstIndex(where: {$0.id == item.id}){
                            favorites.remove(at: index)
                        }
                    }
            }
        }
    }
    
    var body: some View {
        VStack{
            HStack {
                Text("Favorites")
                Spacer()
                Image(systemName: "heart.fill")
                    .padding()
                    .phaseAnimator([false, true]) { content, value in
                        content
                            .foregroundStyle(value ? .red : .yellow)
                            .scaleEffect(value ? 2.0 : 1.0)
                            .animation(.easeInOut(duration: 1.5), value: value)
                    }
//                    animation: { _ in
//                            .easeInOut(duration: 1.5)
//                    }
            }
            .opacity(favorites.isEmpty ? 0 : 1)
            // FavoritesGridView(favorites: $favorites, selected: $selectedItem)
            favoriteGridView
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
                            .matchedGeometryEffect(id: item.id, in: nspace)
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
