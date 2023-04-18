//
//  NoteDomainModel.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 06.04.2023.
//

import Foundation
import CoreData

struct NoteDomainModel: Codable, Identifiable {
    
    var id: String
    var title: String
    var content: String
    var image: ImageDomainModel?
    var category: CategoryDomainModel?
}

extension NoteDomainModel: DatabaseInitializable {
    
    init(from databaseModel: NoteDB) {
        self.id = databaseModel.id ?? ""
        self.title = databaseModel.title ?? ""
        self.content = databaseModel.content ?? ""
        //self.category = .init(from: databaseModel.category!)
    }
}
