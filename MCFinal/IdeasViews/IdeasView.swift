//
//  IdeasView.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import SwiftUI
import SwiftData

struct IdeasView: View {

    @State var openModal = false
    @State var search = ""
    @Environment(Controller.self) private var controller
    
    var hideNavBar = false
    
    var body: some View {

        NavigationStack {
            
            ScrollView{
                ForEach(controller.ideas){idea in
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
            .searchable(text: $search)
        }
        .sheet(isPresented: $openModal, content: {
            NewIdeaModal()
        })
    }
}
