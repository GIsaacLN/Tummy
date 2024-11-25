//
//  QuestionView - ViewModel.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 25/11/24.
//

import Foundation

extension QuestionView {
    @Observable
    class ViewModel {
        var currentQuestionNumber: Int
        var selectedAnswer: Option?
        var questions: [Question]
        var currentQuestion = Question()
        
        init(){
            currentQuestionNumber = 0
            //Agregar Preguntas Aqui
            questions = [Question(title: "Titulo de Pregunta", options: [Option(optionText: "Opcion 1", ponderation: 0)])]
            
            getCurrentQuestion()
        }
        
        func getCurrentQuestion() {
            self.currentQuestion = questions[currentQuestionNumber]
        }
        
        func nextQuestion(){
            if (currentQuestionNumber == questions.count-1) {
                return
            }
            self.currentQuestionNumber += 1
            getCurrentQuestion()
        }
    }
}
