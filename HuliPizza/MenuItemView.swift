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
    @State private var suggestedItem: MenuItem = MenuModel().menu.randomElement() ?? noMenuItem
    @Binding var item : MenuItem
    @ObservedObject var orders : OrderModel
    @Binding var path: NavigationPath
    
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    var allRegular: Bool{
        verticalSizeClass == .regular && horizontalSizeClass == .regular
    }
    
    var isPortrait: Bool{
        verticalSizeClass == .regular && horizontalSizeClass == .compact
    }
    
    var foodImageView: some View{
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
    }
    var descriptionView: some View{
        ScrollView {
            Text(item.description)
                .font(.custom("Georgia", size: 18 , relativeTo: .body))
        }
    }
    var suggestedItemView: some View{
        NavigationLink(value: suggestedItem){
            VStack{
                Text("You Might Also Like")
                    .textCase(.uppercase)
                    .font(.caption)
                MenuRowView(item: suggestedItem)
                    .foregroundStyle(.primary)
            }
            .padding()
            .background(.regularMaterial)
        }
        .navigationDestination(for: MenuItem.self) { _ in
            MenuItemView(item: $suggestedItem, orders: orders, path: $path)
        }
    }
    
    var body: some View {
        VStack {
            if isPortrait{
                VStack{
                    HStack{
                        foodImageView
                        Text(item.name)
                            .surfboardTitle
                    }
                    .surfboardBackground
                    descriptionView
                    suggestedItemView
                }
            } else {
                HStack(alignment: .top){
                    foodImageView
                    descriptionView
                }
                // iPad landscape
                if allRegular {
                    suggestedItemView
                }
            }
            
            HStack{
                Button{
                    orderItem.item = item // pass the item which is our pizza into the order itself
                    presentView = true
                } label: {
                    Spacer()
                    Text(item.price, format: .currency(code: "USD")).bold()
                        .font(path.count <= 1 ? .title : .title3)
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
                .sheet(isPresented: $presentView){
                    path = NavigationPath() // completion handler
                } content: {
                    OrderDetailView(
                        orderItem: $orderItem,
                        presentSheet: $presentView
                    )
                }
                .disabled(item.id < 0)
                .appButtonStyleModifier(backgroundColor: .palm)
                //                .padding()
                //                .background(.red, in: Capsule())
                //                //.background(linearStopGradient, in: Capsule())
                //                .foregroundStyle(.white)
                //                .padding(5)
                CustomBarView(path: $path)
            }
        }
        //        .background (
        //            .angularGradient(
        //                colors: [sky, surf, sky],
        //                center: .leading,
        //                startAngle: Angle(degrees: 0),
        //                endAngle: Angle(degrees: 270))
        //        )
        .navigationBarBackButtonHidden() // hide the back button
        .toolbarVisibility(.hidden, for: .tabBar) // hide the tab toolbar on the bottom
        //        .background(radialGradient)
        .appBackground
    }
}

#Preview {
    MenuItemView(
        item: .constant(testMenuItem),
        orders: OrderModel(),
        path: .constant(NavigationPath())
    )
}
