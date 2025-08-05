//
//  OrderItemView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-08-05.
//

import SwiftUI

struct OrderItemView: View {
    @Binding var orderItem: OrderItem
    @State private var quantity = 1
    @State private var doubleIngredient = false
    @State var pizzaCrust: PizzaCrust
    @State private var name: String = ""
    @State private var comments: String = ""
    init(orderItem: Binding<OrderItem>){
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue
    }
    var body: some View {
        VStack{
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Toggle(isOn: $doubleIngredient) {
                Text("Double Ingredients" + (doubleIngredient ? " Yes" : " No"))
            }
            Stepper(value: $quantity, in : 1...10){
                Text("\(quantity)" + (quantity == 1 ? " Pizza" : " Pizzas"))
            }
            Picker(selection: $pizzaCrust) {
                ForEach(PizzaCrust.allCases, id: \.self){ crust in
                    Text(crust.rawValue).tag(crust) // The tag modifier in a Picker is crucial - it tells SwiftUI what value to assign to the picker's selection when that option is chosen.
                }
            } label: {
                Text("Pizza Crust")
            }
            .pickerStyle(MenuPickerStyle())
            VStack{
                Text("commnets")
                TextEditor(text: $comments)
            }.clipShape(RoundedRectangle(cornerRadius: 3))
                .shadow(radius: 3)
            Spacer()
        }.padding()
    }
}

#Preview {
    OrderItemView(
        orderItem: .constant(testOrderItem))
}
