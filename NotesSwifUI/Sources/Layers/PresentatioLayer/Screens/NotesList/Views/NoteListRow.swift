//
//  NoteListRow.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 21.03.2024.
//

import SwiftUI

struct NoteListRow: View {
    
    var title: String
    var content: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(content)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}

#Preview {
    NoteListRow(title: "Hello", content: "Content")
}
