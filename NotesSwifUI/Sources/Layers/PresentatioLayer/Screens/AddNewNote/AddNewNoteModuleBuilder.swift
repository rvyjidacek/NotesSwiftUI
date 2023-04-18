//
//  AddNewNoteModuleBuilder.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import SwiftUI

extension ModuleBuilder {
    
    static func buildAddNewNote() -> some View {
        let viewModel = AddNewNoteViewModel()
        return NavigationView {
            AddNewNoteView(viewModel: viewModel,
                           state: viewModel.state)
        }
    }
}
