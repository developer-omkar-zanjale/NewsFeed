//
//  LoaderView.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 18/12/24.
//

import SwiftUI

struct LoaderView: View {
    
    @State var isLoading: Bool = false
    @State var isAnimateBackground: Bool = false
    
    var body: some View {
        ZStack(alignment: .center) {
            ColorConstants.overlaysBG.opacity(0.6)
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(ColorConstants.white, lineWidth: 4)
                .frame(width: 35, height: 35)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear
                    .repeatForever(autoreverses: false).speed(0.40), value: isLoading)
                .frame(width: 100, height: 70)
                .padding(12)
                .background {
                    Circle()
                        .foregroundColor(ColorConstants.secondary)
                        .shadow(color: ColorConstants.textColor, radius: 4)
                }
                .padding(.bottom)
        }
        .ignoresSafeArea()
        .onAppear {
            asyncQueue {
                isLoading = true
            }
        }
    }
}

#Preview {
    LoaderView()
}
