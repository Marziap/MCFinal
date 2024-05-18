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
        VStack {
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
                        
                        Text("databases")
                            .bold()
                            .padding(10)
                            .background(.myGray)
                            .cornerRadius(10)
                    }
                    Spacer()
                    VStack {
                        Text("9999")
                            .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        
                        Text("connections")
                        
                    }
                    Spacer()
                    
                    
                }.padding()
                 .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                 .background(.pink)
                
                
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
