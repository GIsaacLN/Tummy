//
//  TipsView.swift
//  Tummy
//
//  Created by Arantza Castro Dessavre on 26/11/24.
//

import SwiftUI

struct TipsView: View {
    
    let tips: [Tips]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 20){
                ForEach(tips) { tip in
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.lightCyan)
                        
                        HStack(spacing: 10) {
                            Text(tip.description)
                                .font(.body)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.pursianBlue)
                            
                            
                            if tip.hasAnimation {
                                DropletAnimationView()
                            } else {
                                Text(tip.image)
                                    .font(.largeTitle)
                                    
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: 300, height: 120)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 40)
    }
}

#Preview {

    // Ejemplos de tips con images
    let sampleTips = [
        Tips(
            description: "Recuerda tomar tus **dos litros de agua** diaria!",
            hasAnimation: true,
            image: "💧"
        ),
        Tips(
            description: "Incluye **frutas y verduras** en cada comida para mejorar tu salud.",
            hasAnimation: false,
            image: "🍎🥦"
        ),
        Tips(
            description: "Haz al menos **30 minutos de ejercicio** al día para mantenerte activo.",
            hasAnimation: false,
            image: "🏃‍♂️"
        ),
        Tips(
            description: "Toma un descanso de **5 minutos por cada hora** de trabajo para evitar el estrés.",
            hasAnimation: false,
            image: "⏱️"
        ),
        Tips(
            description: "Prioriza tu **sueño** y duerme al menos **8 horas** cada noche.",
            hasAnimation: false,
            image: "🛌"
        )
    ]
    
    TipsView(tips: sampleTips)
}

