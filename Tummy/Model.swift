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
    let description: LocalizedStringKey
    let hasAnimation: Bool
    let image: String
    
    init(id: UUID = UUID(), description: LocalizedStringKey, hasAnimation: Bool, image: String) {
        self.description = description
        self.hasAnimation = hasAnimation
        self.image = image
    }
}
