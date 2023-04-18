//
//  NotesListState.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import Foundation

final class NotesListState: ObservableObject {
        
    @Published var notes: [NoteDomainModel] = []
    @Published var isShowingAddNewNote: Bool = false
    @Published var isLoadingData: Bool = false
}
