//
//  TummyView.swift
//  Tummy
//
//  Created by Arantza Castro Dessavre on 26/11/24.
//

import SwiftUI

enum TummyImage: String {
    case tummy1 = "tummy1" // Nombre exacto del recurso de imagen
    case tummy2 = "tummy2"
    case tummy3 = "tummy3"
    
    // Función para devolver la imagen SwiftUI
    func image() -> Image {
        return Image(self.rawValue)
    }
}

struct TummyView: View{
    let tummy: TummyImage
    let message: String
    let action: String
    
    var body: some View{
        ZStack(alignment: .bottomTrailing){
            tummy.image()
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
            
            Image("thoughtBubble")
                .resizable()
                .frame(width: 200, height: 200)
                .overlay(alignment: .center){
                    VStack{
                        Text(message)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text(action)
                            .font(.caption)
                    }
                    .foregroundStyle(.pursianBlue)
                    .offset(y: 20)
                }
        }
    }
}

#Preview(){
    TummyView(tummy: .tummy1, message: "Tengo Hambre", action: "Registra tu consumo")
}