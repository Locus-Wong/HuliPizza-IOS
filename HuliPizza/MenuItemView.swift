//
//  MenuItemView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct MenuItemView: View {
    @State private var addedItem : Bool = false
    var body: some View {
        VStack {
            HStack{
                Text("Margherita Huli Pizza")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                
                if let image = UIImage(named : "0x_lg"){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.top,.bottom], 5)
                    //                    .clipShape(RoundedRectangle(cornerRadius: 10))
                        .cornerRadius(15)
                    
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(180))
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
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at massa et enim volutpat commodo. Sed mattis risus ante, eu suscipit elit auctor ut. Nullam tristique sagittis turpis et dignissim. Proin ullamcorper lacus sit amet nulla porttitor tempus. Donec sed nibh sed dui venenatis gravida. Vestibulum ut ultrices augue. Nunc.")
                        .font(.custom("Georgia", size: 18 , relativeTo: .body))
                }
               
            }
            Button{
                addedItem.toggle()
            } label: {
                Spacer()
                Text(12.99, format: .currency(code: "USD")).bold()
                Image(systemName: addedItem ? "cart.badge.plus.fill" : "cart.badge.plus")
                Spacer()
            }
            .padding()
            .background(.red, in: Capsule())
            .foregroundStyle(.white)
            .padding(5)
          
            
        }
    }
}

#Preview {
    MenuItemView()
}
