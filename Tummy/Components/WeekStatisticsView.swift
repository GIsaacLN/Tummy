//
//  WeekStatisticsView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 26/11/24.
//

import SwiftUI

struct WeekStatisticsView: View {
    let weekDays: [(diaSemana: String, diaNumerico: Int, valor: Bool)]
    let today: Int

    var body: some View {
        VStack {
            HStack(spacing: 7) {
                ForEach(weekDays, id: \.diaNumerico) { day in
                    DayStatisticsView(
                        diaSemana: day.diaSemana,
                        diaNum: day.diaNumerico,
                        valor: day.valor,
                        today: today
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

#Preview {
    WeekStatisticsView(weekDays: [
        ("L", 10, true),
        ("M", 11, false),
        ("M", 12, false),
        ("J", 13, false),
        ("V", 14, false),
        ("S", 15, false),
        ("D", 16, false)
    ], today: 11)
}
