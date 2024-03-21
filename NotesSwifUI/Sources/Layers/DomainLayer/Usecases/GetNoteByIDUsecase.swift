//
//  GetNoteByIDUsecase.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 14.04.2023.
//

import Foundation

final class GetNoteByIDUsecase {
    
    private var notesRepository = NotesRepository()
    
    func use(noteId: String) async throws -> NoteDomainModel {
        return try await notesRepository.getNote(with: noteId)
    }
}
