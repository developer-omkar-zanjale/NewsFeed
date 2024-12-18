//
//  NewsListView.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import SwiftUI

struct NewsListView: View {

    @StateObject var newsViewModel: NewsViewModel
    
    var body: some View {
        ZStack {
            ColorConstants.background.ignoresSafeArea()
            ScrollView {
                if newsViewModel.articles.count > 0 {
                    //MARK: Articles list
                    LazyVStack(content: {
                        ForEach(newsViewModel.articles, id: \.self) { article in
                            NewsListItemView(article: article, onTap: {
                                newsViewModel.selectedArticle = article
                                newsViewModel.isShowNewsDetails = true
                            })
                        }
                    })
                } else {
                    //MARK: No data
                    NoDataPlaceHolderView(isShowLoading: $newsViewModel.isLoading, message: StringConstants.newsNotFound)
                        .padding(.top)
                }
            }
            
            
        }
    }
}

#Preview {
    NewsListView(newsViewModel: NewsViewModel(service: NewsService()))
}
