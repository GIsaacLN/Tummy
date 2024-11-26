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
    let sampleTips = [
        Tips(title: "Tip #1", description: "Toma un **vaso** de agua al despertar."),
        Tips(title: "Tip #2", description: "Haz pausas mientras estudias para mejorar tu concentración."),
        Tips(title: "Tip #3", description: "Recuerda tomar tus dos litros de agua diaria."),
        Tips(title: "Tip #4", description: "Mantente activo con al menos 30 minutos de ejercicio al día."),
        Tips(title: "Tip #5", description: "Prioriza tu sueño para ser más productivo y cuidar tu salud.")
    ]

    var body: some View {
        VStack(spacing : 0){
            HeaderView(health1: 4, health2: 6, rachaTime: 10)
                .padding(.horizontal)
            
            TipsView(tips: sampleTips)
            
            TummyView(tummy: .tummy1, message: "Tengo Hambre", action: "Registra tu consumo")
            
            
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
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(Router())
}
