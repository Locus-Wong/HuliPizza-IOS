//
//  MenuView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

let meshGradient: MeshGradient = MeshGradient(
    width: 4,
    height: 3,
    points: [
        [0.0,0.0], [0.25,0.0], [0.66,0.0], [1.0,0.0],
        [0.0,0.5], [0.5,0.8], [0.66,0.8], [1.0,0.3],
        [0.0,1.0], [0.25,1.0], [0.66,1.0], [1.0,1.0]
    ],
    colors: [
        sky,sky,sky,sky,
        surf,sky,sky,sky,
        surf,surf,surf,surf
    ]
)

struct MenuView: View {
    var menu: [MenuItem]
    @Binding var selectedItem : MenuItem
    var body: some View {
        List(MenuCategory.allCases, id: \.self){ category in // The outer loop goes through each MenuCategory
            Section {
                // Long form: menu.filter({ menuItem in menuItem.category == category })
                ForEach(menu.filter({$0.category == category})){ item in // For each category, it filters the menu array to get only items in that category
                    MenuRowView(item: item)
                        .background(meshGradient)
                        .listRowBackground(Color.clear) // clear the list background
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            } header: {
                Text(category.rawValue)
            }
        }.scrollContentBackground(.hidden)
    }
}

#Preview {
    MenuView(menu: MenuModel().menu, selectedItem: .constant(testMenuItem))
}
