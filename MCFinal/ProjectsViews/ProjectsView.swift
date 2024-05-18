//
//  ProjectsView.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import SwiftUI
import SwiftData

struct ProjectsView: View {
    @Environment(\.modelContext) var modelContext
    @Query var projects: [Project]
    @State var openModal = false
    var hideNavBar = false
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(alignment: .top, spacing: 20) {
                    VStack {
                        ForEach(projects.prefix(projects.count / 2), id: \.self) { project in
                            ProjectCard(project: project)
                        }
                    }
                    VStack {
                        ForEach(projects.suffix(projects.count / 2), id: \.self) { project in
                            ProjectCard(project: project)
                        }
                    }
                }.padding(.horizontal)
                
            }
            .toolbar {
                Button(action: {
                    openModal = true
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.black)
                }
            }
            .navigationTitle("Get Inspired")
            .navigationBarHidden(hideNavBar)
        }
        .sheet(isPresented: $openModal) {
            NewProjectModal()
        }
    }
}



#Preview {
    ProjectsView()
}
