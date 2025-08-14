//
//  HeaderView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders: OrderModel
    @Environment(\.verticalSizeClass) var vSizeClass: UserInterfaceSizeClass? // optional
    var body: some View {
        VStack {
            if(vSizeClass ?? .regular != .compact){
                ZStack(alignment: .bottomTrailing){
                    Image("surfBanner")
                        .resizable()
                        .scaledToFit()
                    //                .scaledToFill()
                    Text("Huli Pizza Company")
                        .font(.custom("Georgia", size: 30, relativeTo: .title))
                    //                .foregroundColor(.sky)
                        .foregroundStyle(.regularMaterial)
                        .fontWeight(.semibold)
                    
                }
            } else {
                HStack(alignment: .bottom){
                    Image("surfBanner")
                        .resizable()
                        .scaledToFit()
                    Text("Huli Pizza Company")
                        .font(.custom("Georgia", size: 30, relativeTo: .title))
                        .foregroundColor(.surf)
                        .fontWeight(.heavy)
                }
            }
        }
        .background(.ultraThinMaterial)
    }
}

#Preview {
    HeaderView().environmentObject(OrderModel())
}
