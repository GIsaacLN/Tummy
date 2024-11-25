//
//  Model.swift
//  Tummy
//
//  Created by Gustavo Isaac Lopez Nunez on 25/11/24.
//

import Foundation

struct Question: Hashable, Identifiable {
    var id = UUID()
    var title: String
    var options: [Option]
    
    init(title: String, options: [Option]) {
        self.title = title
        self.options = options
    }

    init(){
        title = "No Question"
        options = [Option(), Option(), Option(), Option()]
    }
    
}

struct Option: Hashable, Identifiable {
    var id = UUID()
    var optionText: String
    var ponderation: Int
    
    init(optionText: String, ponderation: Int) {
        self.optionText = optionText
        self.ponderation = ponderation
    }
    
    init(){
        optionText = "No Option"
        ponderation = 0
    }
}

