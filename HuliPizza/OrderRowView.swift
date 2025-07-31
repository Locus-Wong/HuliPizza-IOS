//
//  OrderRowView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-07-30.
//

import SwiftUI

struct OrderRowView: View {
    var order:Int
    var body: some View {
        VStack {
            HStack {
                Text("Your Order Item \(order)")
                Spacer()
            }
            HStack{
                Text(1, format: .number)
                Text(19.42, format: .currency(code: "USD"))
                Spacer()
                Text(19.42, format: .currency(code: "USD"))
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    OrderRowView(order: 1)
}
