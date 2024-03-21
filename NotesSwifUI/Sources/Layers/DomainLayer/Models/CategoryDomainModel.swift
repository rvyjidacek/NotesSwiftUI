//
//  CategoryDomainModel.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 06.04.2023.
//

import Foundation
import CoreData

struct CategoryDomainModel: Codable {
    
    var id: String
    var name: String
    var notes: [NoteDomainModel]
}

extension CategoryDomainModel: DatabaseInitializable {
    
    init(from databaseModel: CategoryDB) {
        self.id = databaseModel.id ?? ""
        self.name = databaseModel.name ?? ""
        self.notes = databaseModel.notes.map { .init(from: $0) }
    }
}
