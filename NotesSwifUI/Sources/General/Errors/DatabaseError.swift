//
//  DatabaseError.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 14.04.2023.
//

import Foundation

enum DatabaseError: Error {
    
    case initEntityFailure(entity: String)
    case fetchEntityFailure(entity: String)
}

extension DatabaseError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
            
        case .fetchEntityFailure(let entity):
            return "Undable to fetch entity \(entity)."
            
        case .initEntityFailure(let entity):
            return "Unable to create entity \(entity)."
        }
    }
}
