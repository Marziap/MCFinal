//
//  CommModel.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import Foundation
import SwiftData

@Model
class Community{
    var name: String
    var password: String
    var summary: String
    var isIn: Bool
    
    init(name: String = "Apple Academy", password: String = "12345", summary: String="best place in the world", isIn: Bool = false) {
        self.name = name
        self.password = password
        self.summary = summary
        self.isIn=isIn
    }
}
