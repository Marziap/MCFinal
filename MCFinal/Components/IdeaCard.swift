//
//  IdeaCard.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import SwiftUI
import SwiftData

struct IdeaCard: View {
    @Environment(\.modelContext) var modelContext
    var idea: Idea
    @Query var requests: [Request]
    
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Image("pfp")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:70, height: 70)
                    .cornerRadius(50)
                VStack(alignment:.leading){
                    Text(idea.author)
                        .bold()
                        .font(.title2)
                    Text("@mrzprz")
                }.padding(5)
            }.padding(.top)
            
            Text(idea.text)
                .lineLimit(2, reservesSpace: true)
        
            Text("**Looking for:** \(idea.lookingFor)")
                .padding(.vertical, 5)
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(idea.tags, id: \.self){ tag in
                        Text(tag)
                            .bold()
                            .padding(10)
                            .background(.myGray)
                            .cornerRadius(10)
                    }
                }


            }
            
            HStack {
                Spacer()
                Button(action: {
                    let reqs: [Request] = [Request(user: User(name: "Giorgio Caiazzo", pfp: "feed2"), idea: idea), Request(user: User(name: "Marzia Pirozzi"), idea: idea)]
                    modelContext.insert(reqs[0])
                    modelContext.insert(reqs[1])
                }, label: {
                    Image(systemName: "person.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        .padding(10)
                        .foregroundStyle(.black)
                        .background(.myGray)
                        .cornerRadius(10)
                    
            })
            }.padding(.vertical)
             .padding(.horizontal, 9)
            
            
            
        }
        .padding(.horizontal, 25)
        .background(.otherGray)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
