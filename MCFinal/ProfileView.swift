//
//  ProfileView.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selected = 0
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading){
                    HStack{
                        Spacer()
                        Image("pfp")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:90, height: 90)
                            .cornerRadius(50)
                        Spacer()
                        VStack(alignment:.leading){
                            Text("@mrzprz")
                                .bold()
                                .font(.title2)
                            Text("coder")
                            
                        }.padding(.vertical)
                        Spacer()
                        VStack (alignment: .trailing){
                            
                            HStack{

                                NavigationLink {
                                    Text("settings")
                                } label: {
                                    Image(systemName: "gear")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24)
                                }

                                
                                NavigationLink {
                                    Text("notifications")
                                } label: {
                                    Image(systemName: "bell")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24)
                                }
                                
                                
                                
                            }.padding(.bottom, 10)
                            
                            Text("123")
                                .bold()
                            .font(.title)
                            
                            Text("connections")
                            
                        }
                        Spacer()
                        
                        
                    }.padding()
                     .frame(maxWidth: .infinity)
                     .background(.pink)
                    Spacer()
                    
                    Picker("Section", selection: $selected) {
                        Image(systemName: "lightbulb.2")
                            .tag(0)
                        Image(systemName: "network")
                            .tag(1)
                        Image(systemName: "person.crop.circle")
                            .tag(2)
                    }.pickerStyle(.segmented)
                    
                    switch selected {
                    case 0:
                        IdeasView(hideNavBar: true)
                            
                    case 1:
                        ProjectsView(hideNavBar: true)

                    case 2:
                       PersonalView()
                    default:
                        IdeasView(hideNavBar: true)
                    }
                    
            }
        }
        
    }
}

#Preview {
    ProfileView()
}
