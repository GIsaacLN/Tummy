//
//  QuestionView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 25/11/24.
//

import SwiftUI
import SwiftData

struct QuestionView: View {
    @State private var viewModel = ViewModel()
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack{
            
            Button (action: viewModel.nextQuestion){
                Text("Siguiente Pregunta")
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.white)
            .tint(.orange)
        }
    }
}

#Preview {
    QuestionView()
}
