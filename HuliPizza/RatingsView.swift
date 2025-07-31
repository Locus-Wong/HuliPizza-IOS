//
//  RatingsView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct RatingsView: View {
    var rating: Int
    var body: some View {
        HStack{
//            ForEach(1...rating, id: \.self){ _ in
//                Image(systemName: "fork.knife.circle.fill")
//            }
//            ForEach(1...(6-rating), id: \.self){ _ in
//                Image(systemName: "circle")
//            }
            ForEach(1...6, id: \.self){ circle in
                Image(systemName: (circle <= rating) ? "fork.knife.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    RatingsView(rating: 1)
}
