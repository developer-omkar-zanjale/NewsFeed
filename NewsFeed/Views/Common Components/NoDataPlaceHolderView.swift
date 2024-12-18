//
//  NoDataPlaceHolderView.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 18/12/24.
//

import SwiftUI

struct NoDataPlaceHolderView: View {
    @Binding var isShowLoading: Bool
    var message: String
    var multilineTextAlignment: TextAlignment = .center
    
    var body: some View {
        ZStack {
            VStack {
                Text(isShowLoading ? StringConstants.loading : message)
                    .customText(color: ColorConstants.textColor, fontName: Fonts.figtreeRegular, fontSize: 20, alignment: multilineTextAlignment)
                    .padding(.horizontal)
            }
           
        }
        .padding(.vertical)
    }
}

#Preview {
    NoDataPlaceHolderView(isShowLoading: .constant(false), message: StringConstants.newsNotFound)
}
