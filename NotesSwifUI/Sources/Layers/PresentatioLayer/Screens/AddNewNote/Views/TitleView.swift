//
//  TitleView.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 14.04.2023.
//

import SwiftUI

struct TitleView: View {
    
    var title: String
    
    var body: some View {
        Text("\(title):")
            .font(.title3.bold())
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Section Title")
    }
}
