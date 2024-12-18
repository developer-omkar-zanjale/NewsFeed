//
//  BottomTabView.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import SwiftUI

struct BottomTabView: View {
    @Binding var selectedTab: BottomTab
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(ColorConstants.overlaysBG.opacity(0.7))
            HStack {
                TabButton(title: BottomTab.topHeadlines.rawValue, icon: Assets.Sys_chart_line_uptrend_xyaxis, tab: .topHeadlines)
                TabButton(title: BottomTab.home.rawValue, icon: Assets.Sys_house_fill, tab: .home)
                TabButton(title: BottomTab.fav.rawValue, icon: Assets.Sys_heart_fill, tab: .fav)
            }
            .padding(.horizontal)
        }
        .frame(height: height * 0.079)
    }
    
    @ViewBuilder
    func TabButton(title: String, icon: String, tab: BottomTab) -> some View {
        let isSelected = selectedTab == tab
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(ColorConstants.white.opacity(0.6))
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(isSelected ? ColorConstants.secondary : ColorConstants.primary)
                .padding(2)
            
            HStack(spacing: width * 0.03) {
                Image(systemName: icon)
                    .foregroundStyle(ColorConstants.white)
                if isSelected {
                    Text(title)
                        .customText(color: ColorConstants.white, fontName: Fonts.figtreeMedium, fontSize: 16, alignment: .center)
                }
            }
            .padding(.vertical, 2)
            .padding(.horizontal)
        }
        .padding(.vertical, 10)
        .frame(width: isSelected ? nil : width * 0.18)
        .onTapGesture {
            withAnimation(.bouncy) {
                selectedTab = tab
            }
        }
    }
}

#Preview {
    BottomTabView(selectedTab: .constant(.topHeadlines))
        .padding(.horizontal, 10)
}

