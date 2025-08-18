//
//  ContentView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

let sky = Color.sky
let surf = Color.surf

struct ContentView: View {
    var menu: [MenuItem]
    @StateObject var orders: OrderModel = OrderModel()
    @State private var showOrders: Bool = false
    @State private var selectedItem : MenuItem = noMenuItem
    @State private var presentGrid: Bool = false
    @State private var path: NavigationPath = NavigationPath()
    
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var body: some View {
        VStack {
            if verticalSizeClass == .regular{
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light) // override the environment to light mode for this view
                    .frame(maxHeight: 100)
            } else {
                HStack{
                    Spacer()
                    Text("Huli Pizza Company")
                        .foregroundStyle(.white)
                        .background(.deep)
                }
            }
            StatusBarView(presentGrid: $presentGrid, showOrders: $showOrders)
                .statusBarStyle
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
                    NavigationStack(path: $path){
                        OrderView(orders: orders)
                            .cornerRadius(10)
                    }
                }
                .badge(orders.orderCount) // add the badge to the SF symbol
            }
            //.tabViewStyle(.page) // can slide left/right to switch tab with little icon on the bottom
            Spacer()
        }
        .padding()
//        .background(
//            .linearGradient(
//                colors: [.cyan, .surf, .sky, .white],
//                startPoint: .topLeading,
//                endPoint: .bottom
//            )
//        )
        .appBackground
        .environmentObject(orders)
            .onAppear{
                presentGrid = false
            }
    }
}

#Preview {
    ContentView(menu: MenuModel().menu)
}




