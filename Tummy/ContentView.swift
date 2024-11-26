//
//  ContentView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @EnvironmentObject var router: Router
    
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

    var body: some View {
        VStack(spacing : 0){
            HeaderView(health1: 4, health2: 6, rachaTime: 10)
                .padding(.horizontal)
            
            TipsView(tips: sampleTips)
                .frame(height: 140)
                .padding(.top)
            
            Spacer()
            
            TummyView(tummy: .tummy1, message: "Tengo Hambre", action: "Registra tu consumo")
            
            Spacer()
            
            
            Button {
                router.navigate(to: .questionsView)
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.pursianBlue)
                        .frame(height: 50)
                        .offset(x: 0, y: 5)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.blueGreen)
                        .frame(height: 50)
                    
                    HStack {
                        Image(systemName: "fork.knife")
                            .font(.title)
                            .foregroundStyle(.white)
                        
                        Text("Registra tu comida")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 70)
            }
            .buttonStyle(.plain)
            .padding(.bottom)
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(Router())
}
