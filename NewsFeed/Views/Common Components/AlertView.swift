//
//  AlertView.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 18/12/24.
//

import SwiftUI

struct AlertView: View {
    
    var title: String = StringConstants.warning
    var message: String
    
    var didTapOkay: (()-> Void)?
    
    var body: some View {
        ZStack {
            ColorConstants.overlaysBG.opacity(0.75)
            VStack {
                Text("\(title)")
                    .customText(color: ColorConstants.red, fontName: Fonts.figtreeSemiBold, fontSize: 21, alignment: .center)
                    .padding(.bottom, height * 0.01)
                Text(message)
                    .customText(color: ColorConstants.textColor, fontName: Fonts.figtreeMedium, fontSize: 16, alignment: .center)
                    .padding(.horizontal)
                
                Button(action: {
                    didTapOkay?()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: width * 0.3, height: height / 18)
                            .foregroundStyle(ColorConstants.secondary)
                        Text(StringConstants.okay)
                            .customText(color: ColorConstants.white, fontName: Fonts.figtreeMedium, fontSize: 20, alignment: .center)
                    }
                })
                .padding(.top, height * 0.02)
            }
            .padding(width * 0.03)
            .padding(.vertical, 8)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: width * 0.8)
                    .foregroundStyle(ColorConstants.background.opacity(0.4))
            }
            .frame(width: width * 0.8)
        }
        .frame(width: width)
        .ignoresSafeArea()
    }
}

#Preview {
    AlertView(message: StringConstants.noDescription)
}
