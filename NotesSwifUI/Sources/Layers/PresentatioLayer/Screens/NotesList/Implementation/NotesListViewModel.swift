//
//  NotesListViewModel.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import Foundation

final class NotesListViewModel {
 
    let state = NotesListState()
    var notesRepository = NotesRepository()
}

extension NotesListViewModel {
    
    func loadData()  {
        state.isLoadingData = true
        Task {
            do {
                let notes = try await notesRepository.getAllNotes()
                await MainActor.run {
                    state.notes = notes
                    state.isLoadingData = false
                }
            } catch {
                
            }
        }
    }
    
    func presentAddNewNoteView() {
        state.isShowingAddNewNote = true
    }
}

