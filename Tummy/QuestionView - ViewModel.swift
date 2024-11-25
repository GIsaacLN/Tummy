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
        var currentQuestion: Int
        var selectedAnswer: Answer?
        var questions: [Question]
        
        init(){
            currentQuestion = 1
            //Agregar Preguntas Aqui
            questions = [Question(title: "Titulo de Pregunta", answers: [Answer(option: "Opcion 1", ponderation: 0)])]
        }

    }
}
