//
//  ReceiptView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-08-19.
//

import SwiftUI

struct ReceiptView: View {
    var orders: OrderModel
    @Binding var presentView: Bool
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Receipt")
                    .surfboardTitle
            }.surfboardBackground
            Grid{
                GridRow{
                    Text("Item")
                    Text("Price")
                    Text("Quantity")
                    Text("Ext Price")
                }
                
                ForEach(orders.orderItems){ item in
                    GridRow{
                        Text(item.item.name)
                        Text(item.item.price, format:.currency(code: "USD"))
                        Text(item.quantity, format: .number)
                        Text(item.extPrice, format: .currency(code: "USD"))
                    }
                }
                
                GridRow{
                    Text("Total")
                    Text(orders.orderTotal, format:.currency(code: "USD"))
                }
                
            }
            Spacer()
            Button("OK"){
                presentView = false
            }
            .appButtonStyleModifier(backgroundColor: .sky)
            
        }
        .appBackground
    }
}

#Preview {
    ReceiptView(orders: OrderModel(), presentView: .constant(true))
}
