//
//  NoteDB+Extension.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 06.04.2023.
//

import Foundation
import CoreData

extension NoteDB {
    
    static var entityName: String { "NoteDB" }
    
    convenience init(from domainModel: NoteDomainModel, context: NSManagedObjectContext) throws {
        guard let entity = NSEntityDescription.entity(forEntityName: NoteDB.entityName, in: context) else {
            throw DatabaseError.initEntityFailure(entity: NoteDB.entityName)
        }
        self.init(entity: entity, insertInto: context)
        self.id = domainModel.id
        self.title = domainModel.title
        self.content = domainModel.content
       // self.image =
    }
}

protocol DatabaseEntityConvertible {
    
    associatedtype DBObject
    
    func convertToDBEntity(in context: NSManagedObjectContext) throws -> DBObject
}

extension NoteDomainModel: DatabaseEntityConvertible {
    
    func convertToDBEntity(in context: NSManagedObjectContext) throws -> NoteDB {
         return try NoteDB(from: self, context: context)
    }
}

