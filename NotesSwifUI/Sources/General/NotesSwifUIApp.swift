//
//  NotesSwifUIApp.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 04.04.2023.
//

import SwiftUI

@main
struct NotesSwifUIApp: App {

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ModuleBuilder.buildNotesListModule()
            }
        }
    }
}
