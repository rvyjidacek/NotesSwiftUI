//
//  Repository.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 06.04.2023.
//

import Foundation
import CoreData

class Repository {
    
    let dbManager = DBManager.shared
    // Repository should also has APIClient, SecurityStorageManager, ...
    
    private func fetchEntities<T: DatabaseInitializable>() -> [T] {
        return []
    }
}
