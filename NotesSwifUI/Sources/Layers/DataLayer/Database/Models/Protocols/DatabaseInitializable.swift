//
//  DatabaseInitializable.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 06.04.2023.
//

import Foundation
import CoreData

protocol DatabaseInitializable {
    associatedtype DBObject
    
    init(from databaseModel: DBObject)
}
