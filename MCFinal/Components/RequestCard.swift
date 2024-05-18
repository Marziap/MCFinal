//
//  RequestCard.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import SwiftUI

struct RequestCard: View {
    
    var user: User
    
    var body: some View {
        HStack{
            HStack {
                Image(user.pfp)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(50)
                    .aspectRatio(contentMode: .fit)
                    
                
                VStack{
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .padding(5)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "trash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .padding(5)
                    })
                   
                    
                }
                
            }.padding(15)
                .foregroundStyle(.black)
                .background(.myGray)
                .cornerRadius(10)
        }
    }
}
