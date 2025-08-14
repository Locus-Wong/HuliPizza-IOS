//
//  StyleSheet.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-08-14.
//

import SwiftUI

extension ShapeStyle where Self == Color{
    static var sky: Color{
        Color(red: 0.78, green: 0.937, blue: 1.0)
    }
    
    static var surf: Color{
        Color(red: 0.37, green: 0.527, blue: 0.75)
    }
    
    static var deep: Color{
        Color(red: 0.125, green: 0.227, blue: 0.376)
    }
    
    static var sunset: Color{
        Color(red: 0.90, green: 0.369, blue: 0.102)
    }
    
    static var palm: Color{
        Color(red: 0.357, green: 0.637, blue: 0.239)
    }    
}

struct AppBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    colors: [.sky, .white],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}

extension View {
    var appBackground: some View {
        self.modifier(AppBackground())
    }
}
