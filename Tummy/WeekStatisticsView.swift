//
//  WeekStatisticsView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 26/11/24.
//

import SwiftUI

struct WeekStatisticsView: View {
    let weekDays: [(diaSemana: String, diaNumerico: Int, valor: Bool, isToday: Bool)] = [
        ("L", 10, true, false),
        ("M", 11, false, true),
        ("M", 12, false, false),
        ("J", 13, false, false),
        ("V", 14, false, false),
        ("S", 15, false, false),
        ("D", 16, false, false)
    ]

    var body: some View {
        VStack{
            HStack (spacing: 7){
                ForEach(weekDays, id: \.diaNumerico) { day in
                    DayStatisticsView(
                        diaSemana: day.diaSemana,
                        diaNum: day.diaNumerico,
                        valor: day.valor,
                        isToday: day.isToday
                    )
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 4)
        .padding()

    }
}


#Preview{
    WeekStatisticsView()
}
