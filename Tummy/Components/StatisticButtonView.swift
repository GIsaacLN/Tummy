//
//  StatisticButtonView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 26/11/24.
//

import SwiftUI

struct StatisticButtonView: View {
    @EnvironmentObject var viewModel: StatisticsViewModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.pursianBlue)
                .frame(height: 50)
                .offset(x: 0, y: 5)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.blueGreen)
                .frame(height: 50)
            
            HStack(spacing: 40) {
                Button {
                    viewModel.prevWeek()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                .buttonStyle(.plain)

                HStack {
                    Text(viewModel.currentWeekTitle)
                        .font(.system(size: 15))
                }
                .frame(width: 150)
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))

                Button {
                    viewModel.nextWeek()
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal)
    }
}

#Preview{
    StatisticButtonView()
        .environmentObject(StatisticsViewModel())
}
