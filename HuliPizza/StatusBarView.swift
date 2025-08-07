//
//  StatusBarView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-08-05.
//

import SwiftUI

struct StatusBarView: View {
    @EnvironmentObject var orders: OrderModel
    @Binding var presentGrid: Bool
    @Binding var showOrders: Bool
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) orders")
            Spacer()
            Image(systemName: presentGrid ? "square.grid.3x3.square" : "list.bullet.rectangle")
                .onTapGesture {
                    presentGrid.toggle()
                }
            Button{
                showOrders.toggle()
            } label: {
                Image(systemName: showOrders ? "cart" : "menucard")
            }
            Spacer()
            Text(orders.orderTotal, format: .currency(code: "USD"))
            
            
        }.foregroundStyle(.white)
            .font(.title2)
    }
}

#Preview {
    StatusBarView(presentGrid: .constant(false), showOrders: .constant(false))
        .environmentObject(OrderModel())
}
