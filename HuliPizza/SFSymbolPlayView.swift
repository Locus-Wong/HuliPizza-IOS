//
//  SFSymbolPlay.swift
//  SFSymbolPlayBase
//
//  Created by Steven Lipton on 9/21/24.
//

import SwiftUI

struct SFSymbolPlayView: View {
    @State var isFilled:Bool = false
    @State var isAnimating:Bool = false
    @State var isCircle:Bool = false
    @State var isSlash:Bool = false
    @State var scale:Double = 1.0
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName:"square")
                Spacer()
                Text("Symbol Play")
                    .font(.title).bold()
                Spacer()
                Image(systemName:"square")
            }
            .padding([.leading,.trailing])
            .background(.thickMaterial,in:Capsule())
//Rainbow
            Image(systemName: "rainbow", variableValue: scale) // variableValue to change opacity based on the scale
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.multicolor) // change the rainbow to have multi colors
            HStack{
// Pencil
                Image(systemName: "pencil")
                    .resizable()
                    .scaledToFit()
                    .symbolVariant(isSlash ? .slash : .none)
                    .symbolVariant(isCircle ? .circle : .none)
                    .symbolVariant(isFilled ? .fill : .none)
//                    .symbolRenderingMode(.monochrome)
//                    .foregroundStyle(.yellow) // use with .symbolRenderingMode(.monochrome) to change the color to yellow
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.primary) // the slash is primary layer, and the pencil is secondary
                Spacer()
// Folder with badge
                Image(systemName: isAnimating ? "folder.badge.plus" :"folder.badge.minus" )
                    .resizable()
                    .scaledToFit()
                    .symbolRenderingMode(.multicolor) // change the badge color, but the folder remains
                    .foregroundStyle(.secondary) // change the folder color, but the badge remains
                    .symbolEffect(.rotate, value: isSlash)
            }
            .frame(height:100)
            Spacer()
// 3 Person
            HStack{
                Image(systemName: "person" + (isCircle ? ".2":".3"), variableValue: scale) // Not a variable color symbol, so variableValue: scale doesn't work here
                    .resizable()
                    .scaledToFit()
                    .symbolVariant(isFilled ? .fill : .none)
                    .symbolRenderingMode(.hierarchical) // use opacity to change colors
                    .foregroundStyle(.indigo)
                Spacer()
//  3 person sequential
                Image(systemName: "person.3.sequence", variableValue: scale) // variableValue to change opacity based on the scale
                    .resizable()
                    .scaledToFit()
                    .symbolVariant(.fill)
                    .symbolRenderingMode(.palette) // now can use multi colors for foregroundStyle
                    .foregroundStyle(.green, .indigo, .orange)
            }
            .frame(height:100)
            Spacer()
            VStack(alignment:.leading){
                HStack{
                    Text("Scale")
                    Text(scale,format: .number)
                }
                Slider(value:$scale,in: 0...1)
                    .padding()
                HStack{
                    Button{
                        isFilled.toggle()
                    } label:{
// Fill
                        Image(systemName: "circle" + (isFilled ? ".fill" : ""))
                            .symbolEffect(.bounce, value: isFilled)
                    }
                    Spacer()
                    Button{
                        isCircle.toggle()
                    } label:{
// Circle
                        Image(systemName: "circle" + (isCircle ? "" : ".dotted"))
                            .symbolEffect(.bounce, value: isCircle)
                    }
                    Spacer()
                    Button{
                        isSlash.toggle()
                    } label:{
// Slash
                        Image(systemName: "slash.circle" + (isSlash ? ".fill" : ""))
                            .symbolEffect(.rotate, value: isSlash)
                    }
                    Spacer()
                    Button{
                        isAnimating.toggle()
                    } label:{
// Animating
                        Image(systemName: "play.rectangle" + (isAnimating ? ".fill" : ""))
                            .symbolEffect(
                                .breathe,
                                value: isAnimating
                            ) // discrete value is required for .scale
                    }
                    
                }
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.primary)
            }
            .padding()
            .background(.regularMaterial)
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    SFSymbolPlayView()
}
