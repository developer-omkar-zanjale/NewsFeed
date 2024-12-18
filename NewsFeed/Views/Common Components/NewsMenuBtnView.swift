//
//  NewsMenuBtnView.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import SwiftUI

struct NewsMenuBtnView: View {
    var didTapOpenURL: () -> Void
    var didTapAddToFav: () -> Void
    
    var body: some View {
        Menu {
            MenuButtons()
        } label: {
            Image(systemName: Assets.Sys_ellipsis)
                .rotationEffect(.degrees(90))
                .tint(ColorConstants.textColor)
                .bold()
        }
    }
    
    @ViewBuilder
    func MenuButtons() -> some View {
        VStack {
            Button(action: didTapOpenURL, label: {
                HStack {
                    Text(StringConstants.openURL)
                    Image(systemName: Assets.Sys_arrowshape_turn_up_forward_fill)
                        .tint(ColorConstants.textColor)
                }
            })
            
            Button(action: didTapAddToFav, label: {
                HStack {
                    Text(StringConstants.addToFavorite)
                    Image(systemName: Assets.Sys_heart_fill)
                        .tint(ColorConstants.textColor)
                }
            })
            .disabled(true)
        }
    }
}

#Preview {
    NewsMenuBtnView(didTapOpenURL: {}, didTapAddToFav: {})
}
