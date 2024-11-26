//
//  Model.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 25/11/24.
//

import Foundation
import SwiftUI

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

struct Answer: Identifiable, Hashable {
    let id = UUID()
    let option: String
    let ponderation: Int
}

struct Tips: Identifiable {
    let id = UUID()
    let title: String
    let description: LocalizedStringKey
    
    init(id: UUID = UUID(), title: String, description: LocalizedStringKey) {
        self.title = title
        self.description = description
    }
}
