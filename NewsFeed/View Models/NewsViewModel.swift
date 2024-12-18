//
//  NewsViewModel.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import Foundation

class NewsViewModel: ObservableObject {
    
    let service: NewsServiceProtocol
    var searchQuery: String = "Apple"
    
    @Published var articles: [ArticleDataModel] = []
    @Published var isLoading: Bool = false
    @Published var isShowAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var isShowNewsDetails: Bool = false
    
    @Published var selectedArticle: ArticleDataModel?
    
    init(service: NewsServiceProtocol) {
        self.service = service
    }
    //
    //MARK: Get Top Headlines
    //
    func loadTopHeadlines() {
        printLog("Getting top headlines")
        self.articles.removeAll()
        self.isLoading = true
        self.service.fetchTopHeadlines { [weak self] result in
            asyncQueue {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                case .failure(let error):
                    self?.alertMessage = error.message
                    self?.isShowAlert = true
                }
                self?.isLoading = false
            }
        }
    }
    //
    //MARK: Get Articles
    //
    func loadArticleForQuery() {
        printLog("Getting news")
        self.articles.removeAll()
        self.isLoading = true
        let yesterDay = Date().dayBeforeFormatted
        self.service.fetchArticlesFrom(yesterDay, query: searchQuery) { [weak self] result in
            asyncQueue {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                case .failure(let error):
                    self?.alertMessage = error.message
                    self?.isShowAlert = true
                }
                self?.isLoading = false
            }
        }
    }
    //
    //MARK: Get Favorites
    //
    func loadFavoriteArticles() {
        printLog("Getting favorites")
        self.articles.removeAll()
        self.alertMessage = StringConstants.favoriteStillInDevelopment
        self.isShowAlert = true
    }
}
