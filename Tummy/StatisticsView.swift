//
//  StatisticsView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 26/11/24.
//

import SwiftUI

struct StatisticsView: View {
    var body: some View {
        VStack{
            WeekStatisticsView()
            
            HealthMetricsView()
        }
    }
}

#Preview {
    StatisticsView()
}

