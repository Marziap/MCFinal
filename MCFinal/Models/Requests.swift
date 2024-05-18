//
//  Requests.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import Foundation
import SwiftData

@Model
class Request{
    var user: User
    var idea: Idea
    var isAccepted: Bool
    
    init(user: User = User(), idea: Idea = Idea(), isAccepted: Bool = true) {
        self.user = user
        self.idea = idea
        self.isAccepted = isAccepted
    }
}
