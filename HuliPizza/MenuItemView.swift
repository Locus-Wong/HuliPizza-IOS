//
//  MenuItemView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI
let radialGradient = RadialGradient(
    colors: [surf, sky],
    center: .bottom,
    startRadius: 75,
    endRadius: 300
)
let gradientStops: [Gradient.Stop] = [
    Gradient.Stop(color: surf, location: 0.0),
    Gradient.Stop(color: sky, location: 0.33),
    Gradient.Stop(color: surf, location: 0.95),
    Gradient.Stop(color: sky, location: 1.0),
]

let linearStopGradient = LinearGradient(
    stops: gradientStops,
    startPoint: .top,
    endPoint: .bottom
)

struct MenuItemView: View {
    @State private var addedItem : Bool = false
    @State private var presentView: Bool = false
    @State private var orderItem: OrderItem = noOrderItem
    @Binding var item : MenuItem
    @ObservedObject var orders : OrderModel
    var body: some View {
        VStack {
            HStack{
                Text(item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                
                NavigationLink{
                    ItemImageView(item: item)
                } label: {
                    if let image = UIImage(named : "\(item.id)_lg"){
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .padding([.top,.bottom], 5)
                        //  .clipShape(RoundedRectangle(cornerRadius: 10))
                            .cornerRadius(15)
                        
                    } else {
                        Image("surfboard_lg")
                            .resizable()
                            .scaledToFit()
                            .rotationEffect(.degrees(180))
                    }
                }
               
            }.background(
                .linearGradient(
                    colors: [Color("Surf"),
                             Color("Sky").opacity(0.1)],
                    startPoint: .leading,
                    endPoint: .trailing), in:Capsule()
            ).shadow(color:.teal, radius:5, x:8, y: 8)
            
            
            VStack(alignment: .leading) {
                ScrollView {
                    Text(item.description)
                        .font(.custom("Georgia", size: 18 , relativeTo: .body))
                }
                
            }
            Button{
                orderItem.item = item // pass the item which is our pizza into the order itself
                presentView = true
            } label: {
                Spacer()
                Text(item.price, format: .currency(code: "USD")).bold()
                Image(systemName: addedItem ? "cart.badge.plus.fill" : "cart.badge.plus")
                Spacer()
            }
//            .alert("Buy a \(item.name)?", isPresented: $presentView){
//                Button("Cancel", role: .cancel){}
//                Button("Oh, Yes!") {
//                    addedItem = true
//                    orders.addOrder(item, quantity: 1)
//                }
//            }
            .sheet(
                isPresented: $presentView,
                content: {
                    OrderDetailView(
                        orderItem: $orderItem,
                        presentSheet: $presentView
                    )
                })
            .disabled(item.id < 0)
            .padding()
            .background(.red, in: Capsule())
            //.background(linearStopGradient, in: Capsule())
            .foregroundStyle(.white)
            .padding(5)
            
            
        }
        //        .background (
        //            .angularGradient(
        //                colors: [sky, surf, sky],
        //                center: .leading,
        //                startAngle: Angle(degrees: 0),
        //                endAngle: Angle(degrees: 270))
        //        )
        .background(radialGradient)
    }
}

#Preview {
    MenuItemView(item: .constant(testMenuItem), orders: OrderModel())
}
