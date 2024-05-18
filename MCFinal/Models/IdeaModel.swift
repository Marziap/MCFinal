//
//  IdeaModel.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Idea{
    var name: String
    var author: String
    var text: String
    var lookingFor: String
    var tags: [String]
    var isOpen: Bool
    
    init(name: String = "Game", author: String = "Marzia Pirozzi", text: String = "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo...", lookingFor: String = "Coders", tags: [String] = ["Unity", "Database", "Machine Learning", "Swift", "UI"], isOpen: Bool = true) {
        self.name = name
        self.author = author
        self.text = text
        self.lookingFor = lookingFor
        self.tags = tags
        self.isOpen = isOpen
    }
}
