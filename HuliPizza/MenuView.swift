//
//  MenuView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct MenuView: View {
    var menu: [MenuItem]
    var body: some View {
        ScrollView{
            ForEach(menu){ item in
                MenuRowView(item: item)
            }
        }
    }
}

#Preview {
    MenuView(menu: MenuModel().menu)
}
