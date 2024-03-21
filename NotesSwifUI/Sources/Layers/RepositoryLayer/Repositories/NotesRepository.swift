//
//  NotesRepository.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 06.04.2023.
//

import Foundation

class NotesRepository: Repository {
    
    static private(set) var shared: NotesRepository = NotesRepository()
    
    func getAllNotes() async throws -> [NoteDomainModel] {
        return try await dbManager.fetchEntities(NoteDomainModel.self)
    }
    
    func insert(_ note: NoteDomainModel) async throws {
        try await dbManager.insert(note)
    }
    
    func getNote(with id: String) async throws -> NoteDomainModel {
        return try await dbManager.fetchEntity(NoteDomainModel.self, id: id)
    }
}
