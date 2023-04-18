//
//  NoteDetailViewModel.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import Foundation

final class NoteDetailViewModel {
    
    let state: NoteDetailState
    
    init(nodeId: String) {
        self.state = NoteDetailState(noteId: nodeId)
    }
}

extension NoteDetailViewModel {
    
    func loadData() {
        Task {
            
        }
    }
    
    
}
