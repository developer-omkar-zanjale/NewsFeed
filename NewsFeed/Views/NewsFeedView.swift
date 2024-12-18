//
//  NewsFeedView.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import SwiftUI

struct NewsFeedView: View {
    
    @StateObject var newsVM = NewsViewModel(service: NewsService())
    @State var selectedTab: BottomTab = .home
    
    var body: some View {
        NavigationStack {
            ZStack {
                ColorConstants.background.ignoresSafeArea()
                VStack {
                    NewsListView(newsViewModel: newsVM)
                        .padding(.top, 0.4)
                    Spacer()
                    BottomTabView(selectedTab: $selectedTab)
                        .padding(.horizontal)
                }
                //MARK: Loader
                LoaderView()
                    .opacity(newsVM.isLoading ? 1 : 0)
                
                //MARK: Alert
                AlertView(message: newsVM.alertMessage, didTapOkay: {
                    self.newsVM.isShowAlert = false
                })
                .opacity(newsVM.isShowAlert ? 1 : 0)
            }
            .onChange(of: selectedTab, perform: { _ in
                switch selectedTab {
                case .topHeadlines:
                    self.newsVM.loadTopHeadlines()
                case .home:
                    self.newsVM.loadArticleForQuery()
                case .fav:
                    self.newsVM.loadFavoriteArticles()
                }
            })
            .navigationDestination(isPresented: $newsVM.isShowNewsDetails, destination: {
                if let article = newsVM.selectedArticle {
                    NewsDetailsView(article: article)
                }
            })
        }
        .onAppear {
            self.newsVM.loadArticleForQuery()
        }
    }
}

#Preview {
    NavigationStack {
        NewsFeedView()
    }
}
