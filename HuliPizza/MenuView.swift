//
//  MenuView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ScrollView{
            ForEach(1...30, id: \.self){ item in
                MenuRowView(item: item)
            }
        }
    }
}

#Preview {
    MenuView()
}
