//
//  NotesListModuleBuilder.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import Foundation

extension ModuleBuilder {
    
    static func buildNotesListModule() -> NotesListView {
        let viewModel = NotesListViewModel()
        return NotesListView(viewModel: viewModel,
                             state: viewModel.state)
    }
}
