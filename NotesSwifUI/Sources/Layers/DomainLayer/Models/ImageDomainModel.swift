//
//  ImageDomainModel.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 06.04.2023.
//

import Foundation

struct ImageDomainModel: Codable {
    
    var id: String
    var url: URL
}

extension ImageDomainModel: DatabaseInitializable {
    
    init(from databaseModel: ImageDB) {
        self.id = databaseModel.id ?? ""
        self.url = databaseModel.url!
    }
}
