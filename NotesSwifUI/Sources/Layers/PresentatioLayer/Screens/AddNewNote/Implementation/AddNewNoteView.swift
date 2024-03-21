//
//  AddNewNoteView.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import SwiftUI

struct AddNewNoteView: View {
    
    let viewModel: AddNewNoteViewModel
    @ObservedObject var state: AddNewNoteState
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 16) {
                TitleView(title: "Title")
                
                UPTextField(title:"Insert new note title",
                            text: $state.screenModel.title)
                
                TitleView(title: "Content")
                
                UPTextEditor(text: $state.screenModel.content)
                
                TitleView(title: "Image")
                
                UPTextField(title: "https://example.com/image.png",
                            text: $state.urlString)
                .onChange(of: state.urlString) { newValue in
                    viewModel.validateImageUrl(newValue)
                }
                
                imagePreviewView
                
                saveButton
                
                Spacer()
            }
        }
        .padding()
        .navigationTitle("New Note")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button("Close") {
                    viewModel.saveNewNote()
                }
            }
        }
        .alert("Error", isPresented: $state.isShowingErrorAlert, actions: {
            Button(role: .cancel, action: { }) {
                Text("OK")
            }
        }, message: {
            Text(state.errorTitle)
        })
    }
    
    private var saveButton: some View {
        Button {
            viewModel.saveNewNote()
        } label: {
            Text("Add Note")
                .frame(maxWidth: .infinity)
                .frame(height: 30)
        }
        .buttonStyle(.borderedProminent)
        .padding(vertical: 24)
    }
    
    @ViewBuilder private var imagePreviewView: some View {
        if state.showImagePreview {
            AsyncImage(url: state.screenModel.imageUrl) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                } else if let _ = phase.error {
                    VStack(spacing: 16) {
                        
                        Text("Image Loading Failed")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray)
                            .background(.white)
                    )
                } else {
                    VStack(spacing: 16) {
                        ProgressView()
                            .progressViewStyle(.circular)
                        
                        Text("Loading Preview")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray)
                            .background(.white)
                    )
                }
            }
        }
    }
}

struct AddNewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AddNewNoteViewModel()
        return NavigationView {
            AddNewNoteView(viewModel: viewModel,
                           state: viewModel.state)
        }
    }
}
