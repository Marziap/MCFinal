//
//  ProjectsView.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import SwiftUI
import SwiftData

struct ProjectsView: View {
    @Environment(Controller.self) private var controller
    @State var openModal = false
    @State var search = ""
    var hideNavBar = false

    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(alignment: .top, spacing: 20) {
                    VStack {
                        ForEach(controller.projects.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }) { project in
                            NavigationLink {
                                ProjectDetail(project: project)
                            } label: {
                                ProjectCard(project: project)
                            }
                        }
                    }
                    VStack {
                        ForEach(controller.projects.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }) { project in
                            NavigationLink {
                                ProjectDetail(project: project)
                            } label: {
                                ProjectCard(project: project)
                            }
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
            .searchable(text: $search)
        }
        .sheet(isPresented: $openModal) {
            NewProjectModal()
        }
    }
}

#Preview {
    ProjectsView()
}
