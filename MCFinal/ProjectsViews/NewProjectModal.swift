//
//  NewProjectModal.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct NewProjectModal: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State var title = ""
    @State var summary = ""
    @State var tags = ""
    @State var input = ""
    @State var link = ""
    @State var popoverOn = false
    @State var filtered: [String] = []
    @State var photos: [UIImage] = []
    @State var selectedPhoto: PhotosPickerItem?
    @State private var photoImage: UIImage?
    
    @State private var suggestions = ["unity", "swift", "machine learning", "swift data"]
    
    @State var tagss: [String] = []
    
    var body: some View {
        NavigationStack {
            Form{
                Section {
                    TextField("Title", text: $title)
                }
                
                Section("Preview") {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(photos, id: \.self) { photo in
                                Image(uiImage: photo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(10)
                            }
                            
                            PhotosPicker(selection: $selectedPhoto, matching: .images) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .padding(50)
                                    .foregroundStyle(.black)
                                    .background(.myGray)
                                    .cornerRadius(10)
                            }
                        }
                        .onChange(of: selectedPhoto) { _ in
                            Task {
                                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self),
                                   let uiImage = UIImage(data: data) {
                                    photos.append(uiImage)
                                } else {
                                    print("Failed to load image")
                                }
                            }
                        }
                    }
                }
                
                Section {
                    TextField("Description", text: $summary, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
                
                Section {
                    TextField("Link", text: $link)
                }
                
                Section {
                    TextField("Tags", text: $input)
                    
                        .onChange(of: input, {
                            filtered = suggestions.filter { $0.lowercased().contains(input.lowercased()) }

                            if(filtered.isEmpty){
                                popoverOn=false
                            }else{
                                popoverOn=true
                            }
                        })
                        .onSubmit {
                            if(filtered.isEmpty){
                                suggestions.append(input)
                            }
                            
                            if(!tagss.contains(input)){
                                tagss.append(input)
                            }
                            
                            
                        }
                    
                        .popover(isPresented: $popoverOn,
                                 attachmentAnchor: .point(.center),
                                 content: {
                            HStack {
                                ForEach(filtered, id: \.self) {suggestion in
                                    Button(action: {
                                        input=suggestion
                                        popoverOn=false
                                    }, label: {
                                        Text(suggestion)
                                    })
                                    
                                }
                            }
                            .presentationCompactAdaptation((.popover))
                    })
                }
                
                if(!tagss.isEmpty){
                    Section{
                        HStack{
                            ForEach(tagss, id:\.self){tag in
                                Text(tag)
                                    .bold()
                                    .padding(10)
                                    .background(.myGray)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        let project = Project(name: title, summary: summary, photos: photos.map { $0.pngData()! }, tags: tagss)
                        modelContext.insert(project)
                        dismiss()
                    }) {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.black)
                    }
                }
            }
            .navigationTitle("New Project")
        }
    }
}

#Preview {
    NewProjectModal()
}
