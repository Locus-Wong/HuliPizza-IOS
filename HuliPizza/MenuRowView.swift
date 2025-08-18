//
//  MenuRowView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct MenuRowView: View {
    var item: MenuItem
    var ratingsView: RatingsView{RatingsView(rating: item.rating)}
    @ViewBuilder var namePriceView: some View{
        Text(item.name)
        Spacer()
        Text(item.price, format: .currency(code: "USD"))
    }
    var body: some View {
        HStack (alignment: .top, spacing: 20){
//            if let image = UIImage(named: "\(item.id)_sm"){
//                Image(uiImage: image)
//            } else {
//                Image("surfboard_sm")
//            }
            VStack (alignment: .leading) {
                HStack {
//                    Text(item.name)
//                    Spacer()
//                    Text(item.price, format: .currency(code: "USD"))
                    namePriceView
                }
                //RatingsView(rating: item.rating)
                ratingsView
            }
        }
    }
}

#Preview {
    MenuRowView(item: testMenuItem)
}
