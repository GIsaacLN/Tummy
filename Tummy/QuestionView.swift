//
//  QuestionView.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 25/11/24.
//

import SwiftUI

struct QuestionView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack{
            Text(viewModel.currentQuestion.title)
            
            ForEach(viewModel.currentQuestion.options, id: \.self) { option in
                Text(option.option)
            }

            
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
