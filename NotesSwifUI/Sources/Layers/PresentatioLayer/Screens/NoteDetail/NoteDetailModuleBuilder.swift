//
//  NoteDetailModuleBuilder.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import SwiftUI

extension ModuleBuilder {
    
    static func buildNoteDetail(noteId: String) -> some View {
        let viewModel = NoteDetailViewModel(nodeId: noteId)
        return NoteDetailView(viewModel: viewModel, state:
                                viewModel.state)
    }
}
