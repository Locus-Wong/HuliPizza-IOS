//
//  MenuRowView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct MenuRowView: View {
    var item: Int
    var body: some View {
        HStack (alignment: .top, spacing: 20){
            if let image = UIImage(named: "\(item)_sm"){
                Image(uiImage: image)
            } else {
                Image("surfboard_sm")
            }
            VStack (alignment: .leading) {
                Text("Margherita")
                RatingsView(rating: 3)
            }
        }
    }
}

#Preview {
    MenuRowView(item: 2)
}
