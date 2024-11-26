//
//  HeaderView.swift
//  Tummy
//
//  Created by Arantza Castro Dessavre on 26/11/24.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var router: Router
    
     var health1 : Int
     var health2 : Int
     var rachaTime : Int
    
    var body: some View {
        HStack{
            health
            Spacer()
            
            racha
            
            Button {
                router.navigate(to: .analiticsView)
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.pursianBlue)
                        .frame(width: 50, height: 50)
                        .offset(x: 0, y: 5)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.blueGreen)
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "chart.bar.xaxis")
                        .font(.title)
                        .foregroundStyle(.white)
                }
            }
            .buttonStyle(.plain)

        }
    }
    
    var health: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .frame(width: 50, height: 50)
                    .overlay(alignment:.bottom){
                        UnevenRoundedRectangle(bottomLeadingRadius: 5, bottomTrailingRadius: 5)
                            .fill(.selectedYellow)
                            .frame(width: 50, height: Double(calculateHealth(value: health2)))
                    }
                    .cornerRadius(5)
                    .shadow(radius: 2)
                
                Image(systemName: "waterbottle")
                    .font(.title)
                    .foregroundColor(.pursianBlue)
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .frame(width: 50, height: 50)
                    .overlay(alignment:.bottom){
                        UnevenRoundedRectangle(bottomLeadingRadius: 5, bottomTrailingRadius: 5)
                            .fill(.selectedYellow)
                            .frame(width: 60, height: Double(calculateHealth(value: health1)))
                    }
                    .cornerRadius(5)
                    .shadow(radius: 2)
                
                Image(systemName: "carrot")
                    .font(.title)
                    .foregroundColor(.pursianBlue)
            }

        }
    }
    
    var racha: some View {
        ZStack{
            Image("racha")
                .resizable()
                .frame(width: 60, height: 60)
            
            Text("\(rachaTime)")
                .font(.headline)
        }
    }
    
    
    
    //MARK: - Funciones de la view
    func calculateHealth(value: Int) -> Int {
        return value*5
    }
}



#Preview {
    HeaderView(health1: 8, health2: 5, rachaTime: 10)
}
