//
//  TummyApp.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 25/11/24.
//

import SwiftUI
import SwiftData

@main
struct TummyApp: App {
    let sharedTummyContainer = Self.tummyContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedTummyContainer)
    }
    
    static private func tummyContainer() -> ModelContainer {
        do {
            return try ModelContainer(for: HistoricalData.self)
        } catch {
            fatalError("Could not create tummy container: \(error)")
        }
    }
}
