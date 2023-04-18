//
//  ImageDB+Extension.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 06.04.2023.
//

import Foundation
import CoreData

extension ImageDB {
    
    static var entityName: String { "ImageDB" }
    
    convenience init?(from domainModel: ImageDomainModel, context: NSManagedObjectContext) {
        guard let entity = NSEntityDescription.entity(forEntityName: ImageDB.entityName, in: context) else {
            return nil
        }
        self.init(entity: entity, insertInto: context)
        self.id = domainModel.id
        self.url = domainModel.url
    }
}
