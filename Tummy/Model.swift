//
//  Model.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 25/11/24.
//

import Foundation

struct Question {
    var title: String
    var answers: [Answer]
    
    init(title: String, answers: [Answer]) {
        self.title = title
        self.answers = answers
    }

    init(){
        title = "No Question"
        answers = [Answer(), Answer(), Answer(), Answer()]
    }
    
}

struct Answer {
    var option: String
    var ponderation: Int
    
    init(option: String, ponderation: Int) {
        self.option = option
        self.ponderation = ponderation
    }
    
    init(){
        option = "No Answer"
        ponderation = 0
    }
}

