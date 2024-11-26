//
//  StatisticsView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 26/11/24.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var viewModel: StatisticsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Estadísticas")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)

            WeekStatisticsView(weekDays: viewModel.currentWeek, today: viewModel.today)
            
            ScrollView{
                HealthMetricsView()
            }
            
            Spacer()

            StatisticButtonView()
        }
        .onChange(of: viewModel.currentWeekIndex){
            viewModel.updateCurrentWeek()
        }
    }
}

#Preview {
    StatisticsView()
        .environmentObject(StatisticsViewModel())
}

