//
//  Extension+View.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import SwiftUI

extension View {
    //
    //MARK: Custom Modifiers
    //
    func customNavigationbar(title: String = "", didTapBack: @escaping ()->Void, didTapOpenURL: @escaping ()->Void, didTapAddToFavorite: (()->Void)? = nil) -> some View {
        modifier(NavigationbarModifier(title: title, didTapBack: didTapBack, didTapOpenURL: didTapOpenURL, didTapAddToFavorite: didTapAddToFavorite))
    }
    
    func customText(color: Color = ColorConstants.textColor, fontName: String = Fonts.figtreeRegular, fontSize: Int = 16, alignment: TextAlignment = .leading) -> some View {
        modifier(TextModifier(color: color, fontName: fontName, pixelSize: fontSize, alignment: alignment))
    }
    
    func customBackGesture(dragOffset: CGSize, didSwipeBack: @escaping ()->Void) -> some View {
        modifier(RigthSwipePageBackGesture(dragOffset: dragOffset, didSwipeBack: didSwipeBack))
    }
}
