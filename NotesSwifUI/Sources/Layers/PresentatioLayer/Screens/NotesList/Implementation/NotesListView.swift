//
//  ContentView.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 04.04.2023.
//

import SwiftUI
import Foundation

struct NotesListView: View {
    
    let viewModel: NotesListViewModel
    @ObservedObject var state: NotesListState
    
    var body: some View {
        Group {
            if state.notes.isEmpty {
                emptyView
                    .onAppear {
                        viewModel.loadData()
                    }
            } else if state.isLoadingData {
                VStack(spacing: 24) {
                    ProgressView()
                        .progressViewStyle(.circular)
                    
                    Text("Loading Notes")
                        .foregroundColor(.gray)
                }
            } else {
                notesList
            }
        }
        .navigationTitle("Notes")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.presentAddNewNoteView()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .padding(6)
                        .frame(width: 24, height: 24)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $state.isShowingAddNewNote) {
                    viewModel.loadData()
                } content: {
                    ModuleBuilder.buildAddNewNote()
                }
            }
        }
    }
    
    private var notesList: some View {
        List(state.notes) { note in
            NoteListRow(title: note.title,
                        content: note.content)
        }
        .listStyle(.insetGrouped)
        
    }
    
    private var emptyView: some View {
        VStack(spacing: 24) {
            Image(systemName: "message.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .foregroundColor(.gray.opacity(0.4))
            
            Text("No Content")
                .font(.largeTitle)
            
            Text("You don't have any notes. Use + button to add a new note.")
                .padding(horizontal: 10)
                .multilineTextAlignment(.center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = NotesListViewModel()
        viewModel.state.notes = .mock
        
        return NavigationView {
            NotesListView(viewModel: viewModel,
                          state: viewModel.state)
        }
    }
}

extension Array where Element == NoteDomainModel {
    
    static var mock: [NoteDomainModel] {
        (0...10).map { id in
                .init(id: id.description,
                      title: "Note \(id)",
                      content: .loremIpsum,
                      image: .init(id: UUID().uuidString,
                                   url: URL(string: "https://vyjidacek.cz/zpp2/assets/matrix_reprezentation.png")!),
                      category: .init(id: UUID().uuidString,
                                      name: "Catregory",
                                      notes: []))
        }
    }
}
