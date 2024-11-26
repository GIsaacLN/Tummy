//
//  HealthMetricsView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 26/11/24.
//

import SwiftUI

struct HealthMetricsView: View {
    let healthData: [(id: Int, text: String, value: Int)] = [
        (1, "Calorías Consumidas", value: 20),
        (2, "Agua Consumida", value: 200)]
    var body: some View {
        VStack{
            VStack (alignment: .leading, spacing: 7){
                ForEach(healthData, id: \.id) { data in
                    HealthMetricRowView(text: data.text, value: data.value)
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

struct HealthMetricRowView: View {
    let text: String
    let value: Int
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Text("\(value)")
        }
    }
}

#Preview {
    HealthMetricsView()
}
