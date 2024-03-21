//
//  View+Padding.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import SwiftUI

extension View {

    func padding(vertical: CGFloat, horizontal: CGFloat) -> some View {
        return padding(EdgeInsets(top: vertical,
                                  leading: horizontal,
                                  bottom: vertical,
                                  trailing: horizontal))
    }

    func padding(horizontal: CGFloat, top: CGFloat = 0, bottom: CGFloat = 0) -> some View {
        return padding(EdgeInsets(top: top,
                                  leading: horizontal,
                                  bottom: bottom,
                                  trailing: horizontal))
    }

    func padding(vertical: CGFloat, leading: CGFloat = 0, trailing: CGFloat = 0) -> some View {
        return padding(EdgeInsets(top: vertical,
                                  leading: leading,
                                  bottom: vertical,
                                  trailing: trailing))
    }
}
