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
    let options: [Answer]

    init(id: UUID = UUID(), title: String, options: [Answer]) {
        self.id = id
        self.title = title
        self.options = options
    }
}

struct Answer: Hashable, Identifiable {
    let id = UUID()
    let option: String
    let ponderation: Int
}
