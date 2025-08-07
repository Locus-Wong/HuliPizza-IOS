//
//  ContentView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct ContentView: View {
    var menu: [MenuItem]
    @StateObject var orders: OrderModel = OrderModel()
    @State private var showOrders: Bool = false
    @State private var selectedItem : MenuItem = noMenuItem
    @State private var presentGrid: Bool = false
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme, .light) // override the environment to light mode for this view
          
            StatusBarView(presentGrid: $presentGrid, showOrders: $showOrders)
            if showOrders{
                OrderView(orders: orders)
                    .cornerRadius(10)
            } else {
                MenuItemView(item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial,
                        in: RoundedRectangle(cornerRadius: 10)
                    )
                if presentGrid {
                    MenuGridView(menu: menu, selectedItem: $selectedItem)
                } else{
                    MenuView(menu: menu, selectedItem: $selectedItem)
                } 
            }
            Spacer()
            
        }
        .padding()
        .background(
            .linearGradient(
                colors: [.cyan, Color("Surf"), Color("Sky"), .white],
                startPoint: .topLeading,
                endPoint: .bottom
            )
        ).environmentObject(orders)
            .onAppear{
                presentGrid = true
            }
    }
}

#Preview {
    ContentView(menu: MenuModel().menu)
}




