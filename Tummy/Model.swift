//
//  Model.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 25/11/24.
//

import Foundation

struct Question: Identifiable {
    let id: UUID
    let title: String
    let answers: [Answer]

    init(id: UUID = UUID(), title: String, answers: [Answer]) {
        self.id = id
        self.title = title
        self.answers = answers
    }
}

struct Answer: Identifiable {
    let id = UUID()
    let option: String
    let ponderation: Int
}
