//
//  ContentView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

let sky = Color("Sky")
let surf = Color("Surf")

struct ContentView: View {
    var menu: [MenuItem]
    @StateObject var orders: OrderModel = OrderModel()
    @State private var showOrders: Bool = false
    @State private var selectedItem : MenuItem = noMenuItem
    @State private var presentGrid: Bool = false
    @State private var path: NavigationPath = NavigationPath()
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme, .light) // override the environment to light mode for this view
            
            StatusBarView(presentGrid: $presentGrid, showOrders: $showOrders)
            TabView {
                Tab("Menu", systemImage: "menucard"){
                    NavigationStack(path: $path){
                        
                           
                        if presentGrid {
                            MenuGridView(menu: menu, selectedItem: $selectedItem)
                        } else{
                            MenuView(menu: menu, selectedItem: $selectedItem, path: $path)
                        }
                    }
                }
                Tab("Orders", systemImage: "cart"){
                    OrderView(orders: orders)
                        .cornerRadius(10)
                }
                .badge(orders.orderCount) // add the badge to the SF symbol
            }
            //.tabViewStyle(.page) // can slide left/right to switch tab with little icon on the bottom
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
                presentGrid = false
            }
    }
}

#Preview {
    ContentView(menu: MenuModel().menu)
}




