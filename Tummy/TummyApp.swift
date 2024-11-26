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
    
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                ContentView()
                    .navigationDestination(for: Router.Destination.self){ destination in
                        switch destination {
                        case .questionsView:
                            QuestionView(modelContext: self.sharedTummyContainer.mainContext)
                        case .profileView:
                            EmptyView()
                        case .analiticsView:
                            EmptyView()
                        }
                    }
            }
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

final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case questionsView
        case analiticsView
        case profileView
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
