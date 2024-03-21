//
//  UPTextEditor.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 14.04.2023.
//

import SwiftUI

struct UPTextEditor: View {
    
    @Binding var text: String
    
    var body: some View {
        TextEditor(text: $text)
            .frame(height: 200)
            .submitLabel(.done)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray)
                    .background(.white)
            )
    }
}

struct UPTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        @State var text: String = "Hello World!"
        
        UPTextEditor(text: $text)
            .padding()
    }
}
