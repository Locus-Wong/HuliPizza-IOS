//
//  MenuView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct MenuView: View {
    var menu: [MenuItem]
    @Binding var selectedItem : MenuItem
    var body: some View {
        List(MenuCategory.allCases, id: \.self){ category in // The outer loop goes through each MenuCategory
            Section {
                // Long form: menu.filter({ menuItem in menuItem.category == category })
                ForEach(menu.filter({$0.category == category})){ item in // For each category, it filters the menu array to get only items in that category
                    MenuRowView(item: item)
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            } header: {
                Text(category.rawValue)
            }
        }
    }
}

#Preview {
    MenuView(menu: MenuModel().menu, selectedItem: .constant(testMenuItem))
}
