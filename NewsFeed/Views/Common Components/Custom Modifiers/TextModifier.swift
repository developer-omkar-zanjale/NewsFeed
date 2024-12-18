//
//  TextModifier.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import SwiftUI

struct TextModifier: ViewModifier {
    
    var color: Color
    var fontName: String
    var pixelSize: Int
    var alignment: TextAlignment
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(color)
            .font(.custom(fontName, size: getFontSizeByWidth(pixels: pixelSize)))
            .multilineTextAlignment(alignment)
    }
}
