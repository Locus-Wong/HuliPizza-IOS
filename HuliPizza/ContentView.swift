//
//  ContentView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct ContentView: View {
    var orders:[Int] = [1,2,3,4,6]
    var showOrders: Bool = true
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
            if showOrders{
                OrderView(orders: orders)
                    .cornerRadius(10)
            } else {
                MenuItemView()
                    .padding(5)
                    .background(.thinMaterial,
                        in: RoundedRectangle(cornerRadius: 10)
                    )
                MenuView()
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
        )
    }
}

#Preview {
    ContentView()
}




