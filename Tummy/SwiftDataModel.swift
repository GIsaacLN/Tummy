//
//  SwiftDataModel.swift
//  Tummy
//
//  Created by Raymundo Mondragon Lara on 25/11/24.
//

import Foundation
import SwiftData


@Model
class HistoricalData {
    var id: UUID
    var date: Date
    var value: Double
    
    init(id: UUID, date: Date, value: Double) {
        self.id = id
        self.date = date
        self.value = value
    }
}



// For testing
extension Date {
    func last(day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: .now)!
    }
}

let ChartFoodModel: [HistoricalData] = [
    .init(id: UUID(), date: Date().last(day: -1), value: 400),
    .init(id: UUID(), date: .now.last(day: -2), value: 900),
    .init(id: UUID(), date: .now.last(day: -3), value: 690),
    .init(id: UUID(), date: .now.last(day: -4), value: 550),
    .init(id: UUID(), date: .now.last(day: -5), value: 800),
    .init(id: UUID(), date: .now.last(day: -6), value: 820),
    .init(id: UUID(), date: .now.last(day: -7), value: 600)
]
