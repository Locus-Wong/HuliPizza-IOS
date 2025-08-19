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
                        .gridColumnAlignment(.leading)
                        .gridCellAnchor(.center) // override the column alignment for one cell
                    Text("Price")
                        .gridColumnAlignment(.trailing)
                        .gridCellAnchor(.center)
                    Text("Quantity")
                    Text("Ext Price")
                        .gridColumnAlignment(.trailing)
                        .gridCellAnchor(.center)
                }
                Divider() // a horizontal divider line
                ForEach(orders.orderItems){ item in
                    GridRow{
                        Text(item.item.name)
                        Text(item.item.price, format:.currency(code: "USD"))
                        Text(item.quantity, format: .number)
                        Text(item.extPrice, format: .currency(code: "USD"))
                    }
                }
                Divider()
                GridRow{
                    Text("Total")
                        .gridCellColumns(3)
                        .gridCellAnchor(.trailing)
                    Text(orders.orderTotal, format:.currency(code: "USD"))
                }
                
            }
            .background(.regularMaterial)
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
