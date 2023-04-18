//
//  AddNewNoteError.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 14.04.2023.
//

import Foundation

enum AddNewNoteError: Error {
    
    case wrongImageUrl
}

extension AddNewNoteError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
            
        case .wrongImageUrl:
            return "URL for image is not valid or is missing."
        }
    }
}
