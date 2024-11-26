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
        var selectedAnswer : [UUID: [Answer]] = [:]
        var questions: [Question] = []
        
        init(){
            currentQuestion = 0
            //Agregar Preguntas Aqui
            questions = [
                    Question(title: "¿Qué porcentaje de tu plato contenía frutas o verduras?", answers: [
                        Answer(option: "Menos de 25%", ponderation: 1),
                        Answer(option: "Entre 25% y 50%", ponderation: 2),
                        Answer(option: "Entre 50% y 75%", ponderation: 3),
                        Answer(option: "Más de 75%", ponderation: 4)]),
                    
                    Question(title: "El plato que comiste ¿Dónde lo conseguiste?", answers: [
                        Answer(option: "Comida rápida", ponderation: 1),
                        Answer(option: "Comida Corrida", ponderation: 2),
                        Answer(option: "Hecha en casa", ponderation: 3),
                        Answer(option: "Restaurante", ponderation: 4)]),
                    
                    Question(title: "¿Qué tan satisfecho te sentiste después de comer?", answers: [
                        Answer(option: "Satisfecho", ponderation: 1),
                        Answer(option: "Neutral", ponderation: 2),
                        Answer(option: "Insatisfecho", ponderation: 3),
                        Answer(option: "No sé", ponderation: 4)]),
                        
                    Question(title: "¿Cuánto tiempo te tomó comer?", answers: [
                        Answer(option: "Menos de 10 minutos", ponderation: 1),
                        Answer(option: "10-20 minutos", ponderation: 2),
                        Answer(option: "20-30 minutos", ponderation: 3),
                        Answer(option: "Más de 30 minutos", ponderation: 4)]),
                    
                    Question(title: "¿Qué bebida acompañó tu comida?", answers: [
                        Answer(option: "Agua", ponderation: 1),
                        Answer(option: "Refresco", ponderation: 2),
                        Answer(option: "Jugo natural", ponderation: 3),
                        Answer(option: "Ninguna", ponderation: 4)]),
                        
                    Question(title: "¿Cómo describirías la calidad nutricional de tu comida?", answers: [
                        Answer(option: "Buena", ponderation: 1),
                        Answer(option: "Regular", ponderation: 2),
                        Answer(option: "Mala", ponderation: 3),
                        Answer(option: "No sé", ponderation: 4)])
                    ]
        }
        
        func selectAnswer(_ answer: Answer, for question: Question) {
            selectedAnswer[question.id] = [answer]
        }
        
        func nextQuestion() {
            if currentQuestion > questions.count - 1 {
                let aux = calculateScore()
            } else {
                currentQuestion += 1
            }
        }
        
        func previousQuestion() {
            if currentQuestion > 0 {
                currentQuestion -= 1
            }
        }
        
        func calculateScore() -> Int {
            var score: Int = 0
            
            for question in questions {
                if let selectedAnswer = selectedAnswer[question.id] {
                    score += selectedAnswer.reduce(0) { $0 + $1.ponderation }
                }
            }
            
            return score
        }
    }
}
