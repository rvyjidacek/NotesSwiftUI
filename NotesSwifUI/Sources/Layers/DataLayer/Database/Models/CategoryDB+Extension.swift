//
//  CategoryDB+Extension.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 06.04.2023.
//

import Foundation
import CoreData

extension CategoryDB {
    
    var notes: [NoteDB] { notesSet?.allObjects as? [NoteDB] ?? [] }
    
    static var entityName: String { "CategoryDB" }
}
