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
            ProgressView(value: Double(viewModel.currentQuestion + 1) / Double(viewModel.questions.count))
                .tint(.orange)
            
            Spacer()
            
            Text(viewModel.questions[viewModel.currentQuestion].title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            
            ForEach(viewModel.questions[viewModel.currentQuestion].answers, id: \.self) { answer in
                
                Button {
                    viewModel.selectAnswer(answer, for: viewModel.questions[viewModel.currentQuestion])
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(isSelected(answer) ?? false ? Color.orange : Color.white)
                            .shadow(radius: 5, y: 4)
                            .frame(height: 42)
                        
                        Text(answer.option)
                            .foregroundStyle(.black)
                    }
                    .padding([.top, .horizontal])
                }

            }
            
            Button (action: viewModel.nextQuestion){
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(hasSelected() ? (Color.black.opacity(0.5)) : (Color.orange.opacity(0.5)))
                        .frame(height: 40)
                        .offset(x: 0, y: 5)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(hasSelected() ? .gray : .orange)
                            .frame(height: 40)
                    
                    if viewModel.currentQuestion < viewModel.questions.count - 1 {
                        Text("Siguiente")
                            .fontWeight(.bold)
                    } else {
                        Text("Terminar")
                            .fontWeight(.bold)
                    }
                    
                }
                .padding(.horizontal, 100)
            }
            .buttonStyle(.borderless)
            .foregroundStyle(.white)
            .tint(.clear)
            .disabled(hasSelected())
            .padding()
        }
        .padding()
    }
    
    //MARK: - Funciones de la vista
    ///Devuelve true si la respuesta está selecionada, se usa para updatear los modifiers de cada respuesta
    private func isSelected(_ answer: Answer) -> Bool {
        if let selectedAnswers = viewModel.selectedAnswer[viewModel.questions[viewModel.currentQuestion].id] {
            return selectedAnswers.contains(where: { $0.id == answer.id })
        }
        return false
    }

    /// Se usa para permitir/restringir el continuar a la siguiente pregunta
    private func hasSelected() -> Bool {
        if let selected = viewModel.selectedAnswer[viewModel.questions[viewModel.currentQuestion].id], !selected.isEmpty {
            // Comprobamos que existe al menos una respuesta seleccionada
            return false
        }
        return true  // Devolver true si no hay respuesta seleccionada
    }
}

#Preview {
    QuestionView()
}
