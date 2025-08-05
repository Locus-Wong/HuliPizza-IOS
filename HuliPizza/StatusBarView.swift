//
//  StatusBarView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-08-05.
//

import SwiftUI

struct StatusBarView: View {
    @EnvironmentObject var orders: OrderModel
    @Binding var showOrders: Bool
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) orders")
            Spacer()
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
    StatusBarView(showOrders: .constant(false)).environmentObject(OrderModel())
}
