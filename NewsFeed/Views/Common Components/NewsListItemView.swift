//
//  NewsListItemView.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import SwiftUI

struct NewsListItemView: View {
    
    @Environment(\.openURL) var openURL
    
    var article: ArticleDataModel
    var onTap: ()->Void
    
    @State private var image: UIImage?
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                //MARK: Image Card
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(ColorConstants.overlaysBG.opacity(0.2))
                        .frame(width: width * 0.3, height: width * 0.32)
                    if let img = image {
                        Image(uiImage: img)
                            .resizable()
                            .frame(width: width * 0.3, height: width * 0.32)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    } else {
                        //Image Loader
                        ProgressView()
                            .controlSize(.large)
                            .tint(ColorConstants.textColor)
                    }
                }
                //MARK: Content
                VStack(alignment: .leading, spacing: 8) {
                    Text(article.title.checkToShow(StringConstants.noTitle))
                        .customText(color: ColorConstants.textColor, fontName: Fonts.figtreeExtraBold, fontSize: 18, alignment: .leading)
                        .lineLimit(4)
                    Text(article.description.checkToShow(StringConstants.noDescription))
                        .customText(color: ColorConstants.textColor.opacity(0.6), fontName: Fonts.figtreeRegular, fontSize: 16, alignment: .leading)
                        .lineLimit(2)
                }
                .padding(.leading, 10)
                
                Spacer(minLength: 1)
                
                //MARK: Menu Button
                VStack {
                    NewsMenuBtnView(didTapOpenURL: {
                        if let url = URL(string: article.url) {
                            openURL(url)
                        }
                    }, didTapAddToFav: {
                        //TODO: Add to favorite functionality handling
                    })

                    Spacer()
                }
                .frame(height: width * 0.24)
                
            }
            .padding()
        }
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(ColorConstants.overlaysBG.opacity(0.4))
        }
        .onTapGesture {
            onTap()
        }
        .padding(.horizontal, 12)
        .onAppear {
            ImageLoader.sharedLoader.imageForUrl(article.urlToImage) { image, url in
                self.image = image
            }
            asyncAfter(2) {
                if self.image == nil {
                    //Redownloading image if image not found after 2 sec
                    ImageLoader.sharedLoader.imageForUrl(article.urlToImage) { image, url in
                        self.image = image
                    }
                }
            }
        }
        
    }
    
    
}

#Preview {
    VStack {
        
        NewsListItemView(article: DummyData.Article1, onTap: {})
        NewsListItemView(article: DummyData.Article2, onTap: {})
    }
}
