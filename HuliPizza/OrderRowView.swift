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
        HStack (alignment:.firstTextBaseline){
            Text("Your Order Item \(order)")
            Spacer()
            Text(19.42, format: .currency(code: "USD"))
        }
    }
}

#Preview {
    OrderRowView(order: 1)
}
