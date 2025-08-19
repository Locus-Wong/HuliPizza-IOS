//
//  SplitViewMenu.swift
//  HuliPizza
//
//  Created by Locus Wong on 2025-08-19.
//

import SwiftUI

struct SplitViewMenu: View {
    private var menu = MenuModel().menu
    var body: some View {
        NavigationSplitView{
            List(menu){ item in
                NavigationLink{
                    VStack{
                        MenuRowView(item: item)
                            .surfboardBackground
                        Text(item.description)
                        .listRowStyleModifier(imageID: item.id)
                    }
                    .surfboardTitle
                } label: {
                    Text(item.name)
                        .surfboardTitle
                        .surfboardBackground
                }
               
            }
        } detail: {
            Text("Huli Pizza Company")
                .surfboardTitle
                .surfboardBackground
        }
    }
}

#Preview {
    SplitViewMenu()
}
