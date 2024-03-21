//
//  AddNewNoteViewModel.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import Foundation

final class AddNewNoteViewModel {
    
    let state = AddNewNoteState()
    let saveNewNoteUsecase = SaveNewNoteUsecase()
}

extension AddNewNoteViewModel {
    
    func saveNewNote() {
        Task {
            do {
                guard let url = state.screenModel.imageUrl else { throw AddNewNoteError.wrongImageUrl }
                
                try await saveNewNoteUsecase.use(title: state.screenModel.title,
                                                 content: state.screenModel.content,
                                                 url: url)
            } catch {
                await MainActor.run {
                    state.errorTitle = error.localizedDescription
                    state.isShowingErrorAlert = true
                }
            }
        }
    }
    
    func validateImageUrl(_ urlString: String) {
        guard urlString.isValidURL else  { return }
        
        if let url = URL(string: urlString) {
            state.screenModel.imageUrl = url
            state.showImagePreview = urlString.isValidURL
        }
    }
}
