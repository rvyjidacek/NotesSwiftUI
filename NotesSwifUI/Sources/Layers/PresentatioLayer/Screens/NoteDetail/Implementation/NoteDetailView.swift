//
//  NoteDetailView.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import SwiftUI

struct NoteDetailView: View {
    
    let viewModel: NoteDetailViewModel
    @ObservedObject var state: NoteDetailState
    
    var body: some View {
        Group {
            VStack(spacing: 16) {
                ProgressView()
                    .progressViewStyle(.circular)
                
                Text("Loading note")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Note Detail")
        .onAppear {
            viewModel.loadData()
        }
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = NoteDetailViewModel(nodeId: "22")
        
        NavigationView {
            NoteDetailView(viewModel: viewModel,
                           state: viewModel.state)
        }
    }
}
