//
//  HeaderView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders: OrderModel
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing){
                Image("surfBanner")
                    .resizable()
                    .scaledToFit()
                //                .scaledToFill()
                Text("Huli Pizza Company")
                    .font(.custom("Georgia", size: 30, relativeTo: .title))
                //                .foregroundColor(Color("Sky"))
                    .foregroundStyle(.regularMaterial)
                    .fontWeight(.semibold)
                
            }
            Label{
                Text(orders.orderTotal, format: .currency(code: "USD"))
            }
            icon:{
                Image(
                    systemName: orders.orderItems.isEmpty ? "cart" : "cart.fill"
                )
            }
        }
        .background(.ultraThinMaterial)
    }
}

#Preview {
    HeaderView().environmentObject(OrderModel())
}
