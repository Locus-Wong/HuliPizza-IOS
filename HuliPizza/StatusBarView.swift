//
//  StatusBarView.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-08-05.
//

import SwiftUI

enum GridToggleAnimation: CaseIterable {
    case inPhase  // opacity: 1.0, size: 1.0 (normal)
    case midPhase // opacity: 0.0, size: 0.5 (fade out & shrink)
    case outPhase // opacity: 0.5, size: 2.0 (semi-transparent & big)
    
    // computed properties
    var opacity: Double {
        switch self {
        case .inPhase: 1.0
        case .midPhase: 0.0
        case .outPhase: 0.5
        }
    }
    
    var size: Double {
        switch self {
        case .inPhase: 1.0
        case .midPhase: 0.5
        case .outPhase: 2.0
        }
    }
    
}

struct StatusBarView: View {
    @EnvironmentObject var orders: OrderModel
    @Binding var presentGrid: Bool
    @Binding var showOrders: Bool
    
    var discountTier: Double {
        orders.orderTotal / 50.00
    }
    
    var isDiscountFulfilled: Bool {
        discountTier >= 1.0
    }
    
    var isEmptyBasket: Bool {
        orders.orderItems.isEmpty
    }
    
    var body: some View {
        HStack {
            Image(
                systemName: "rainbow",
                variableValue: discountTier)
            .symbolRenderingMode(.multicolor)
            .symbolEffect(
                .disappear,
                isActive: isEmptyBasket
            )
            .symbolEffect(
                .variableColor,
                isActive: isDiscountFulfilled
            )
            
            Text("\(orders.orderItems.count) orders")
            Spacer()
            Image(systemName: presentGrid ? "square.grid.3x3.square" : "list.bullet.rectangle")
                .symbolEffect(.disappear, isActive: showOrders)
            // phaseAnimator is a powerful SwiftUI modifier that creates multi-stage animations that cycle through different phases automatically
            //                .phaseAnimator(
            //                    GridToggleAnimation.allCases,
            //                    trigger: presentGrid
            //                ){ content, phase in
            //                    content
            //                        .opacity(phase.opacity)  // Changes opacity per phase
            //                        .scaleEffect(phase.size) // Changes size per phase
            //                } animation: { phase in
            //                    switch phase {
            //                    case .inPhase: .bouncy      // Use Bouncy transition TO midPhase
            //                    case .midPhase: .linear     // Use Linear transition TO outPhase
            //                    case .outPhase: .easeOut    // Use EaseOut transition back TO inPhase
            //                    }
            //                }
            //                .onTapGesture {
            //                    presentGrid.toggle()
            //                }
            Button{
                showOrders.toggle()
            } label: {
                Image(systemName: showOrders ? "cart" : "menucard")
                    .contentTransition(.symbolEffect(.replace))
                            }
                //            .phaseAnimator(
                //                GridToggleAnimation.allCases,
                //                trigger: showOrders
                //            ){ content, phase in
                //                content
                //                    .opacity(phase.opacity)
                //                    .scaleEffect(phase.size)
                //            } animation: { phase in
                //                switch phase {
                //                case .inPhase: .bouncy
                //                case .midPhase: .linear
                //                case .outPhase: .easeOut
                //                }
                //            }
                Spacer()
                Label{
                    Text(orders.orderTotal, format: .currency(code: "USD"))
                } icon: {
                    //Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.fill")
                    Image(systemName: "cart")
                        .symbolVariant(isEmptyBasket ? .none : .fill)
                        .symbolEffect(.bounce, value: isEmptyBasket)
                        .symbolEffect(.scale.up, isActive: isDiscountFulfilled)
                }
                
            }.foregroundStyle(.white)
                .font(.title2)
        
    }
}

#Preview {
    StatusBarView(presentGrid: .constant(false), showOrders: .constant(false))
        .environmentObject(OrderModel())
}
