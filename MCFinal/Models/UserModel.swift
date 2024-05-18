//
//  UserModel.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import Foundation
import SwiftData

@Model
class User{
    var name: String
    var usename: String
    var ruolo: String
    var pfp: String
    
    init(name: String = "Marzia Pirozzi", usename: String = "mrzprz", ruolo: String = "coder", pfp: String = "pfp") {
        self.name = name
        self.usename = usename
        self.ruolo = ruolo
        self.pfp = pfp
    }
}
