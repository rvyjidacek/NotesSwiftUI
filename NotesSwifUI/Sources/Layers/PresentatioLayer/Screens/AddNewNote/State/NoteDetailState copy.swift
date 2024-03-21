//
//  NoteDetailState.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import Foundation

final class NoteDetailState: ObservableObject {
        
    var noteId: String
    
    init(noteId: String) {
        self.noteId = noteId
    }
}

