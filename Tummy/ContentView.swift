//
//  ContentView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @EnvironmentObject var router: Router

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
