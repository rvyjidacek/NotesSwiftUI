//
//  SaveNewNoteUsecase.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import Foundation

final class SaveNewNoteUsecase {
    
    private let notesrepository = NotesRepository()
    
    func use(title: String, content: String, url: URL?) async throws {
        let domainModel = NoteDomainModel(id: UUID().uuidString,
                                          title: title,
                                          content: content,
                                          image: .init(id: UUID().uuidString,
                                                       url: url!))
        try await notesrepository.insert(domainModel)
    }
}
