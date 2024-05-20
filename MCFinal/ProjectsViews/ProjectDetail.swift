//
//  ProjectDetail.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 20/05/24.
//

import SwiftUI

struct ProjectDetail: View {
    
    @State private var images: [String] = ["feed1","feed2","feed5","feed4","feed3", ]
    
    //TODO: like and comments
    
    var project: Project
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(project.photos, id:\.self){image in
                                
                                let uiImage = UIImage(data: image)
                                
                                Image(uiImage: uiImage!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
                                    .scrollTransition { content, phase in
                                        content.opacity(phase.isIdentity ? 1:0.5)
                                    }
                            }
                        }.scrollTargetLayout()
                    
                    }
                    .contentMargins(25, for: .scrollContent)
                    .scrollTargetBehavior(.viewAligned)
                        
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(project.tags, id: \.self){ tag in
                                Text(tag)
                                    .bold()
                                    .padding(10)
                                    .background(.myGray)
                                    .cornerRadius(10)
                            }
                        }
                    }.padding()
                    
                    Text(project.summary)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.myGray)
                        .cornerRadius(10)
                    
                    Text("[GitHub](https://www.google.com)")
                                 .tint(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.myGray)
                        .cornerRadius(10)
                        
                    
                        .navigationTitle(project.name)
               
            }
                .padding()
            
            }
        }
    }
}
