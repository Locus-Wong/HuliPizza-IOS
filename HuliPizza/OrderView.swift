//
//  OrderView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

let orderBackground = LinearGradient(
    stops: gradientStops,
    startPoint: .bottomLeading,
    endPoint: .topTrailing
)

let cellBackground = RadialGradient(
    colors: [sky, .red,. yellow, .green, .blue, .purple, sky],
    center: .bottomTrailing,
    startRadius: 90,
    endRadius: 140
)

struct OrderView: View {
    @ObservedObject var orders: OrderModel
    var body: some View {
        VStack {
            ZStack(alignment: .top){
                
                ScrollView{
                    ForEach($orders.orderItems){ order in
                        //Text(order.item.name)
                        OrderRowView(order: order)
                            .padding(4)
//                            .background(
//                                .regularMaterial,
//                                in: RoundedRectangle(cornerRadius: 10)
//                            )
                            .background(
                                cellBackground,
                                in: RoundedRectangle(cornerRadius: 10)
                            )
                            .shadow(radius: 10)
                            .padding(.bottom, 5)
                            .padding([.leading, .trailing], 7)
                            //.animation(Spring(.bouncy, duration: 2), value: orders)
                            .onLongPressGesture {
                                orders.removeOrder(id: order.id)
                            }
                            .animation(.bouncy(
                                duration: 2
                            ), value: orders.orderItems.count)
                    }
                }
                .padding(.top, 70)
                HStack {
                    Text("Order Pizza")
                        .font(.title)
                    Spacer()
                 
                }.padding()
                    .background(.ultraThinMaterial)
            }
            .padding()
//            Button("Delete Order"){
//                if !orders.orderItems.isEmpty{
//                    orders.removeLast()
//                }
//            }.padding(5)
//                .background(.regularMaterial, in : Capsule())
//                .padding(7)
            
        }.background(orderBackground)
    }
}

#Preview {
    OrderView(orders: OrderModel())
}
