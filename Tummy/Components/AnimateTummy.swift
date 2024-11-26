//
//  AnimateTummy.swift
//  Tummy
//
//  Created by Arantza Castro Dessavre on 26/11/24.
//

import SwiftUI

struct AnimateTummy: View{
    @State private var isWaving = false
    @Binding var isTailWagging : Bool
    @Binding var speed: Double

    var body: some View {
        ZStack {
            
            // Cola
            Image("cola")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 1600)
                .offset(x: -100, y: 10) // Ajusta la posición según sea necesario
                .rotationEffect(.degrees(isTailWagging ? -1 : 3), anchor: .bottomLeading)
                .animation(.easeInOut(duration: speed).repeatForever(autoreverses: true), value: isTailWagging)
                
            
            // Cuerpo del panda
            Image("tummyCuerpoConOrejas")
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
            
            
            // Brazo derecho
            Image("brazoDer")
                .resizable()
                .scaledToFit()
                .frame(width: 190, height: 260)
                .offset(x: 130, y: 0) // Ajusta la posición según sea necesario
                .rotationEffect(.degrees(isWaving ? 10 : 0), anchor: .center)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isWaving)
        }
        .onAppear {
            isWaving = true
        }
    }
}

#Preview {
    AnimateTummy(isTailWagging: .constant(false), speed: .constant(0.7))
}
