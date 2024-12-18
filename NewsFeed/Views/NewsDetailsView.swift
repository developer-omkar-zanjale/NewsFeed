//
//  NewsDetailsView.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import SwiftUI

struct NewsDetailsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) var openURL
    @GestureState private var dragOffset = CGSize.zero
    
    @State private var image: UIImage?
    
    var article: ArticleDataModel
    
    var body: some View {
        ZStack {
            ColorConstants.background.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text(article.title.checkToShow(StringConstants.noTitle))
                        .customText(fontName: Fonts.figtreeExtraBold, fontSize: 20)
                    HStack(alignment: .top, spacing: 0, content: {
                        //MARK: Headline
                        Text("\(Date.convertDateString(article.publishedAt)) \(StringConstants.by) ")
                            .customText(color: ColorConstants.textColor.opacity(0.6))
                        Text(article.author.checkToShow(StringConstants.unknownAuthor))
                            .customText(color: ColorConstants.textColor, fontName: Fonts.figtreeSemiBold)
                        
                        Spacer(minLength: 4)
                        //MARK: Open URL Btn
                        Button(action: {
                            if let url = URL(string: article.url) {
                                openURL(url)
                            }
                        }, label: {
                            Image(systemName: Assets.Sys_arrowshape_turn_up_forward_fill)
                                .tint(ColorConstants.textColor.opacity(0.8))
                                .padding(.trailing, 6)
                        })
                    })
                    //MARK: Article Image
                    NewsImageCard
                    
                    //MARK: Description
                    Text(article.description.checkToShow(StringConstants.noDescription))
                        .customText(color: ColorConstants.textColor.opacity(0.7))
                        .padding(.horizontal, 4)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 4)
            }
        }
        .customNavigationbar(didTapBack: {
            dismiss()
        }, didTapOpenURL: {
            if let url = URL(string: article.url) {
                openURL(url)
            }
        })
        .customBackGesture(dragOffset: dragOffset, didSwipeBack: {
            dismiss()
        })
        .onAppear {
            ImageLoader.sharedLoader.imageForUrl(article.urlToImage) { image, url in
                self.image = image
            }
            asyncAfter(3) {
                if self.image == placeholderImage {
                    //Redownloading image if image not found after 3 sec
                    ImageLoader.sharedLoader.imageForUrl(article.urlToImage) { image, url in
                        self.image = image
                    }
                }
            }
        }
    }
    
    @ViewBuilder 
    var NewsImageCard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(ColorConstants.overlaysBG.opacity(0.2))
                .frame(width: width * 0.9, height: width * 0.7)
            if let img = image {
                //MARK: Image
                Image(uiImage: img)
                    .resizable()
                    .frame(width: width * 0.9, height: width * 0.7)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else {
                //Image Loader
                ProgressView()
                    .controlSize(.large)
                    .tint(ColorConstants.textColor)
            }
        }
    }
}

#Preview {
    NavigationStack {
        NewsDetailsView(article: DummyData.Article1)
    }
}
