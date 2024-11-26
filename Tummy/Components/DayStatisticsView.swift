//
//  DayStatisticsView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 26/11/24.
//

import SwiftUI

struct DayStatisticsView: View {
    let diaSemana: String
    let diaNum: Int
    let valor: Bool
    let today: Int

    var bgcolor: Color {
        if diaNum < today {
            return .selectedYellow
        } else if diaNum > today {
            return .selectedYellow.opacity(0.5)
        } else if diaNum == today {
            return .utOrange
        } else {
            return .gray
        }
    }
    var body: some View {
        VStack{
            Text(diaSemana)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
            
            VStack {
                ZStack {
                    if valor {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                    }
                }
            }
            .frame(width: 40, height: 70)
            .background(bgcolor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("\(diaNum)")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
        }
        .padding(0)
    }
}

#Preview {
    DayStatisticsView(diaSemana: "L", diaNum: 10, valor: true, today: 11)
}

#Preview {
    DayStatisticsView(diaSemana: "M", diaNum: 11, valor: false, today: 11)
}
