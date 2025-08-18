//
//  OrderRowView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var order: OrderItem
    
    @ViewBuilder var extPrice: some View{
        Text(order.extPrice, format: .currency(code: "USD"))
            .fontWeight(.semibold)
    }
    
    @ViewBuilder var pizzaNameView: some View{
        Text(order.item.name)
        Spacer()
        if order.quantity <= 1 {
            extPrice
        }
    }
    
    @ViewBuilder var extendedPriceView: some View{
        if order.quantity > 1 {
            Text(order.quantity, format: .number)
            Text(" Pizzas")
            Spacer()
            extPrice
        } else{
            Text("Single Pizza")
        }
    }
    
    var body: some View {
        VStack {
            HStack {
//                Text(order.item.name)
//                Spacer()
                pizzaNameView
            }
            HStack{
//                Text(order.quantity, format: .number)
//                Text(order.item.price, format: .currency(code: "USD"))
//                Spacer()
//                Text(order.extPrice, format: .currency(code: "USD"))
//                    .fontWeight(.semibold)
                extendedPriceView
            }
        }
    }
}

#Preview {
    OrderRowView(order: .constant(testOrderItem))
}
