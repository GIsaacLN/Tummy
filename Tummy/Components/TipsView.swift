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
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(tip.title)
                                .font(.headline)
                                .foregroundColor(.black)
                            Text(tip.description)
                                .font(.body)
                                .foregroundColor(.black)
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
    let sampleTips = [
        Tips(title: "Tip #1", description: "Toma un **vaso** de agua al despertar."),
        Tips(title: "Tip #2", description: "Haz pausas mientras estudias para mejorar tu concentración."),
        Tips(title: "Tip #3", description: "Recuerda tomar tus dos litros de agua diaria."),
        Tips(title: "Tip #4", description: "Mantente activo con al menos 30 minutos de ejercicio al día."),
        Tips(title: "Tip #5", description: "Prioriza tu sueño para ser más productivo y cuidar tu salud.")
    ]
    
    TipsView(tips: sampleTips)
}

