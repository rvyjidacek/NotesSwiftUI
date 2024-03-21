//
//  AddNewNoteState.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import Foundation

final class AddNewNoteState: ObservableObject {
            
    @Published var screenModel = AddNewNoteScreenModel()
    @Published var isSavingNote: Bool = false
    @Published var urlString: String = ""
    @Published var showImagePreview: Bool = false
    
    @Published var isShowingErrorAlert: Bool = false
    var errorTitle: String = ""
}

struct AddNewNoteScreenModel {
    
    var title: String = ""
    var content: String = ""
    var imageUrl: URL?
}

