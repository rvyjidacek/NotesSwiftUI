//
//  UPTextField.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 14.04.2023.
//

import SwiftUI

struct UPTextField: View {
    
    var title: String
    @Binding var text: String
    
    var body: some View {
        TextField(title, text: $text)
            .submitLabel(.done)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray)
                    .background(.white)
            )
    }
}

struct UPTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        @State var text: String = "Hello World"
        
        UPTextField(title: "Hello", text: $text)
    }
}
