//
//  IdeasView.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import SwiftUI
import SwiftData

struct IdeasView: View {

    
    @Environment(\.modelContext) var modelContext
    @Query var ideas: [Idea]
    @State var openModal = false
    var hideNavBar = false
    
    var body: some View {

        NavigationStack {
            
            ScrollView{
                ForEach(ideas){idea in
                    NavigationLink {
                       IdeaDetail(idea: idea)
                    } label: {
                        IdeaCard(idea: idea)
                    }
 
                }
            }
            
            .navigationTitle("Eureka")
            .toolbar{
                Button(action: {
                    openModal=true
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.black)
                })
            }
            .navigationBarHidden(hideNavBar)
        }
        .sheet(isPresented: $openModal, content: {
            NewIdeaModal()
        })
    }
}

#Preview {
    IdeasView()
}
