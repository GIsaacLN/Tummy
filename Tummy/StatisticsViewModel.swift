//
//  StatisticsViewModel.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 26/11/24.
//

import Foundation

final class StatisticsViewModel: ObservableObject {
    let weeks: [[(String, Int, Bool)]]
    let today: Int

    @Published var currentWeekIndex: Int
    @Published var currentWeek: [(String, Int, Bool)] {
        didSet {
            updateWeekTitle()
        }
    }
    @Published var currentWeekTitle: String = ""

    init() {
        // Datos de las semanas, ajustados para que el 26 de noviembre caiga en martes
        self.weeks = [
            [("L", 4, true), ("M", 5, false), ("M", 6, true), ("J", 7, false), ("V", 8, true), ("S", 9, false), ("D", 10, true)],
            [("L", 11, true), ("M", 12, false), ("M", 13, false), ("J", 14, true), ("V", 15, false), ("S", 16, true), ("D", 17, false)],
            [("L", 18, false), ("M", 19, true), ("M", 20, false), ("J", 21, false), ("V", 22, true), ("S", 23, false), ("D", 24, true)],
            [("L", 25, true), ("M", 26, false), ("M", 27, false), ("J", 28, false), ("V", 29, false), ("S", 30, false), ("D", 1, false)]
        ]
        self.today = 26 // Día actual: 26 de noviembre (martes)
        self.currentWeekIndex = 0 // Inicialización temporal
        self.currentWeek = weeks[0] // Inicialización temporal

        // Configurar la semana actual basada en el día de hoy
        if let initialIndex = weeks.firstIndex(where: { $0.contains(where: { $0.1 == today }) }) {
            self.currentWeekIndex = initialIndex
            self.currentWeek = weeks[initialIndex]
        }

        updateWeekTitle()
    }

    func prevWeek() {
        if currentWeekIndex > 0 {
            print("prev week")
            currentWeekIndex -= 1
            currentWeek = weeks[currentWeekIndex]
        }
    }
    
    func updateCurrentWeek() {
        print("updating week")
        currentWeek = weeks[currentWeekIndex]
    }

    func nextWeek() {
        if currentWeekIndex < weeks.count - 1 {
            print("next week")
            currentWeekIndex += 1
            currentWeek = weeks[currentWeekIndex]
        }
    }

    private func updateWeekTitle() {
        guard let firstDay = currentWeek.first, let lastDay = currentWeek.last else { return }
        currentWeekTitle = "\(firstDay.1) - \(lastDay.1) \(monthName(for: firstDay.1))"
    }

    private func monthName(for day: Int) -> String {
        // Example mapping for simplicity
        return "Noviembre"
    }
}
