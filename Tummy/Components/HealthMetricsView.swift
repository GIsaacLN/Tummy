//
//  HealthMetricsView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 26/11/24.
//

import SwiftUI

struct HealthMetricsView: View {
    var body: some View {
        VStack(spacing: 20) {
            MetricCardView(
                title: "Calorías Quemadas",
                icon: "flame.fill",
                value: "450 / 600 kcal",
                progress: 0.75,
                color: .selectedYellow
            )
            MetricCardView(
                title: "Ingesta de Agua",
                icon: "drop.fill",
                value: "1.5 L / 2.0 L",
                progress: 0.75,
                color: .selectedYellow
            )
            MetricCardView(
                title: "Macronutrientes",
                icon: "leaf.fill",
                value: "80% Carbohidratos\n60% Proteínas\n50% Grasas",
                progress: 0.70,
                color: .selectedYellow
            )
            /*
            MetricCardView(
                title: "Micronutrientes",
                icon: "bolt.heart.fill",
                value: "Calcio: 🟡 Hierro: 🟢 Vitamina C: 🔴",
                progress: 0.90,
                color: .utOrange
            )
             */
        }
        .padding()
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
        .padding(.horizontal)
    }
}

struct MetricCardView: View {
    let title: String
    let icon: String
    let value: String
    let progress: Double
    let color: Color

    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Circle()
                    .stroke(color.opacity(0.3), lineWidth: 10)
                Circle()
                    .trim(from: 0, to: CGFloat(progress))
                    .stroke(color, lineWidth: 10)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: progress)
                Image(systemName: icon)
                    .font(.system(size: 30))
                    .foregroundColor(color)
            }
            .frame(width: 60, height: 60)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.pursianBlue)
                Text(value)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 4)
    }
}

#Preview {
    HealthMetricsView()
}
