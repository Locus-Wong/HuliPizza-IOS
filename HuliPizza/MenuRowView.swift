//
//  MenuRowView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct MenuRowView: View {
    var item: MenuItem
    var body: some View {
        HStack (alignment: .top, spacing: 20){
            if let image = UIImage(named: "\(item.id)_sm"){
                Image(uiImage: image)
            } else {
                Image("surfboard_sm")
            }
            VStack (alignment: .leading) {
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.price, format: .currency(code: "USD"))
                }
                RatingsView(rating: item.rating)
            }
        }
    }
}

#Preview {
    MenuRowView(item: testMenuItem)
}
