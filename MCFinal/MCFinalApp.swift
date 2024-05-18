//
//  MCFinalApp.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import SwiftUI
import SwiftData

@main
struct MCFinalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Idea.self, Project.self, Community.self, User.self, Request.self])
        }
    }
}
