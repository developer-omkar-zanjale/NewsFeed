//
//  NavigationbarModifier.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 18/12/24.
//

import SwiftUI

struct NavigationbarModifier: ViewModifier {
    
    var title: String
    var didTapBack: ()->Void
    var didTapOpenURL: ()->Void
    var didTapAddToFavorite: (()->Void)?
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                //MARK: Navigation Bar
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button(action: {
                        didTapBack()
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: Assets.Sys_ChevronLeft)
                                .resizable()
                                .frame(width: 9, height: 15, alignment: .center)
                            Text(StringConstants.back)
                        }
                        .customText(color: ColorConstants.textColor, fontName: Fonts.figtreeBold, fontSize: 18)
                        .foregroundStyle(ColorConstants.textColor.gradient)
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NewsMenuBtnView(didTapOpenURL: {
                        didTapOpenURL()
                    }, didTapAddToFav: {
                        didTapAddToFavorite?()
                    })
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(title)
    }
}
